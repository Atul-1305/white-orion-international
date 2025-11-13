ActiveAdmin.register AboutSection do
  # Strong parameters
  permit_params :section_type, :title, :content, :image, :position

  # Index page (list view)
  index do
    selectable_column
    id_column
    column :section_type
    column :title
    column :content do |section|
      truncate(section.content.to_s, length: 100)
    end
    column :image do |section|
      if section.image.attached?
        image_tag url_for(section.image), size: "80x80", style: "object-fit: cover; border-radius: 8px;"
      else
        status_tag("No Image", :warning)
      end
    end
    column :position
    actions
  end

  # Show page (details view)
  show do
    attributes_table do
      row :id
      row :section_type
      row :title
      row :content do |section|
        simple_format(section.content)
      end
      row :image do |section|
        if section.image.attached?
          image_tag url_for(section.image), size: "300x200", style: "object-fit: cover; border-radius: 12px;"
        else
          status_tag("No Image", :warning)
        end
      end
      row :position
      row :created_at
      row :updated_at
    end
  end

  # Form (new/edit page)
  form do |f|
    f.inputs do
      f.input :section_type, as: :select, collection: AboutSection.section_types.keys
      f.input :title
      f.input :content
      if f.object.image.attached?
        div do
          image_tag url_for(f.object.image), size: "150x150", style: "object-fit: cover; border-radius: 10px; margin-bottom: 10px;"
        end
      end
      f.input :image, as: :file, hint: "Upload or replace image"
      f.input :position
    end
    f.actions
  end
end
