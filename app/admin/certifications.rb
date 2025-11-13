ActiveAdmin.register Certification do
  permit_params :name, :active, :sort_order, :image

  # Filters
  filter :name
  filter :active
  filter :sort_order
  filter :created_at

  # Index Page
  index do
    selectable_column
    id_column
    column :image do |cert|
      if cert.image.attached?
        image_tag url_for(cert.image), height: "50", style: "border-radius: 6px; object-fit: cover;"
      else
        status_tag "No Image", class: "status-warning"
      end
    end
    column :name
    column :active do |c|
      if c.active
        status_tag "Active", class: "status-ok"
      else
        status_tag "Inactive", class: "status-warning"
      end
    end
    column :sort_order
    column :created_at
    actions
  end

  # Show Page
  show do
    attributes_table do
      row :id
      row :name
      row :active do |c|
        if c.active
          status_tag "Active", class: "status-ok"
        else
          status_tag "Inactive", class: "status-warning"
        end
      end
      row :sort_order
      row :image do |cert|
        if cert.image.attached?
          image_tag url_for(cert.image), height: "150", style: "border-radius: 10px; object-fit: cover;"
        else
          status_tag "No Image", class: "status-warning"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  # Form Page
  form do |f|
    f.inputs "Certification Details" do
      f.input :name
      f.input :active
      f.input :sort_order
      f.input :image, as: :file, hint: (
        if f.object.persisted? && f.object.image.attached?
          image_tag url_for(f.object.image), height: "100", style: "border-radius: 8px;"
        else
          content_tag(:span, "No image uploaded")
        end
      )
    end
    f.actions
  end
end
