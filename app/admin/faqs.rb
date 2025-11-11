ActiveAdmin.register Faq do
  permit_params :question, :answer, :position, :active

  index do
    selectable_column
    id_column
    column :question
    column :position
    column :active
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :question
      f.input :answer, as: :text
      f.input :position
      f.input :active
    end
    f.actions
  end
end
