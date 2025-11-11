# app/admin/about_sections.rb
ActiveAdmin.register AboutSection do
  permit_params :section_type, :title, :content, :image, :position

  form do |f|
    f.inputs do
      f.input :section_type, as: :select, collection: AboutSection.section_types.keys
      f.input :title
      f.input :content
      f.input :image, as: :file
      f.input :position
    end
    f.actions
  end
end


