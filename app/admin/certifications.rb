# app/admin/certifications.rb
ActiveAdmin.register Certification do
  permit_params :name, :active, :sort_order, :image

  form do |f|
    f.inputs "Certification Details" do
      f.input :name
      f.input :active
      f.input :sort_order
      f.input :image, as: :file, hint: (
        if f.object.persisted? && f.object.image.attached?
          image_tag(url_for(f.object.image), height: "100")
        else
          content_tag(:span, "No image uploaded")
        end
      )
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :active
    column :sort_order
    column :image do |cert|
      if cert.image.attached?
        image_tag url_for(cert.image), height: "50"
      else
        "No image"
      end
    end
    actions
  end
end
