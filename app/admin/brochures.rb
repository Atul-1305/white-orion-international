ActiveAdmin.register Brochure do
  permit_params :title, :active, :file

  form do |f|
    f.inputs "E-Brochure Details" do
      f.input :title
      f.input :active
      f.input :file, as: :file, hint: (f.object.file.attached? ? link_to("View Current", url_for(f.object.file), target: "_blank") : content_tag(:span, "No file uploaded"))
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :active
    column("File") { |b| b.file.attached? ? link_to("View", url_for(b.file), target: "_blank") : "No file" }
    actions
  end
end
