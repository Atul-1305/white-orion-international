ActiveAdmin.register Subcategory do
  permit_params :name, :status, :category_id

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :status
    end
    f.actions
  end
end
