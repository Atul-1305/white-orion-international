ActiveAdmin.register Director do
  permit_params :name, :position, :bio, :photo, :linkedin, :sort_order

  form do |f|
    f.inputs do
      f.input :name
      f.input :position
      f.input :bio
      f.input :photo, as: :file
      f.input :linkedin
      f.input :sort_order
    end
    f.actions
  end
end
