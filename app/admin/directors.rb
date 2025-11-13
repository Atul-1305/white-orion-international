ActiveAdmin.register Director do
  permit_params :name, :position, :bio, :photo, :linkedin, :sort_order

  # Filters
  filter :name
  filter :position
  filter :linkedin
  filter :sort_order
  filter :created_at

  # Index Page
  index do
    selectable_column
    id_column
    column :photo do |director|
      if director.photo.attached?
        image_tag url_for(director.photo), size: "50x50", style: "border-radius: 50%; object-fit: cover;"
      else
        status_tag "No Image", :warning
      end
    end
    column :name
    column :position
    column :linkedin do |d|
      link_to "View Profile", d.linkedin, target: "_blank" if d.linkedin.present?
    end
    column :sort_order
    actions
  end

  # Show Page
  show do
    attributes_table do
      row :id
      row :photo do |director|
        if director.photo.attached?
          image_tag url_for(director.photo), size: "150x150", style: "border-radius: 10px; object-fit: cover;"
        else
          status_tag "No Image", :warning
        end
      end
      row :name
      row :position
      row :bio
      row :linkedin do |d|
        link_to d.linkedin, d.linkedin, target: "_blank" if d.linkedin.present?
      end
      row :sort_order
      row :created_at
      row :updated_at
    end
  end

  # Form Page
  form do |f|
    f.inputs do
      f.input :name
      f.input :position
      f.input :bio
      f.input :photo, as: :file, hint: (
        if f.object.photo.attached?
          image_tag url_for(f.object.photo), size: "100x100", style: "border-radius: 8px; object-fit: cover;"
        else
          content_tag(:span, "No image uploaded yet")
        end
      )
      f.input :linkedin
      f.input :sort_order
    end
    f.actions
  end
end
