ActiveAdmin.register Album do
  # Allow nested array params safely
  permit_params :title, { images: [] }, { remove_image_ids: [] }

  form html: { multipart: true } do |f|
    f.inputs "Album Details" do
      f.input :title
    end

    f.inputs "Album Images" do
      # new image upload (won’t delete old)
      f.input :images, as: :file, input_html: { multiple: true }

      # show existing images with checkbox
      if f.object.images.attached?
        div style: "display:flex; flex-wrap:wrap; gap:15px; margin-top:10px;" do
          f.object.images.each do |img|
            div style: "text-align:center; border:1px solid #ddd; padding:5px; border-radius:5px;" do
              span do
                image_tag url_for(img),
                          style: "width:120px;height:120px;object-fit:cover;display:block;margin-bottom:5px;"
              end
              span do
                raw(
                  ActionController::Base.helpers.check_box_tag(
                    "album[remove_image_ids][]", img.id, false, id: "remove_image_#{img.id}"
                  ) +
                  ActionController::Base.helpers.label_tag("remove_image_#{img.id}", "Remove",
                                                           style: "display:block;margin-top:3px;cursor:pointer;")
                )
              end
            end
          end
        end
      end
    end

    f.actions
  end

  controller do
    def update
      # ✅ 1. Remove only checked images
      if params[:album][:remove_image_ids].present?
        params[:album][:remove_image_ids].each do |id|
          resource.images.find_by(id: id)&.purge
        end
      end

      # ✅ 2. Prevent overwrite of existing images when new ones are added
      if params[:album][:images].present?
        params[:album][:images].each { |img| resource.images.attach(img) }
        params[:album].delete(:images)
      end

      # ✅ 3. Update other fields
      resource.update(permitted_params[:album].except(:images, :remove_image_ids))

      redirect_to resource_path(resource), notice: "Album updated successfully!"
    end
  end
end
