ActiveAdmin.register Category do
  permit_params :name, :description, :status

  filter :name
  filter :status, as: :select, collection: ["active", "inactive"]
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    # column :description do |category|
    #   truncate(category.description.to_s, length: 80)
    # end
    column :status do |category|
      if category.status == true || category.status.to_s == "active"
        status_tag "Active", class: "status-ok"
      else
        status_tag "Inactive", class: "status-warning"
      end
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      # row :description do |category|
      #   simple_format(category.description)
      # end
      row :status do |category|
        if category.status == true || category.status.to_s == "active"
          status_tag "Active", class: "status-ok"
        else
          status_tag "Inactive", class: "status-warning"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      # f.input :description
      f.input :status, as: :boolean, label: "Active?"
    end
    f.actions
  end
end
