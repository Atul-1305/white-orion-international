ActiveAdmin.register Subcategory do
  permit_params :name, :status, :category_id

  # Filters
  filter :name
  filter :category
  filter :status, as: :select, collection: ["active", "inactive"]
  filter :created_at

  # Index page
  index do
    selectable_column
    id_column
    column :category
    column :name
    column :status do |subcategory|
      if subcategory.status == true || subcategory.status.to_s == "active"
        status_tag "Active", class: "status-ok"
      else
        status_tag "Inactive", class: "status-warning"
      end
    end
    column :created_at
    actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :category
      row :name
      row :status do |subcategory|
        if subcategory.status == true || subcategory.status.to_s == "active"
          status_tag "Active", class: "status-ok"
        else
          status_tag "Inactive", class: "status-warning"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  # Form
  form do |f|
    f.inputs do
      f.input :category, as: :select, collection: Category.all.collect { |c| [c.name, c.id] }, include_blank: "Select Category"
      f.input :name
      f.input :status, as: :boolean, label: "Active?"
    end
    f.actions
  end
end
