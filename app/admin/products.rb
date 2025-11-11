ActiveAdmin.register Product do
  permit_params :name, :description, :price, :status, :category_id, :subcategory_id, :image

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :status

      # Category select (required)
      f.input :category, 
              collection: Category.all.map { |c| [c.name, c.id] }, 
              include_blank: "Select Category"

      # Subcategory select (optional)
      f.input :subcategory, 
              collection: Subcategory.all.map { |s| ["#{s.category.name} → #{s.name}", s.id] }, 
              include_blank: "No Subcategory"

      # Image upload
      f.input :image, as: :file, hint: (
        if f.object.persisted? && f.object.image.attached?
          image_tag(url_for(f.object.image), height: "100")
        else
          content_tag(:span, "No image uploaded")
        end
      )
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :status
      row :category do |product|
        product.subcategory&.category || product.category
      end
      row :subcategory do |product|
        product.subcategory ? product.subcategory.name : "—"
      end
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), height: "100"
        else
          "No image uploaded"
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :category do |product|
      product.subcategory&.category || product.category
    end
    column :subcategory do |product|
      product.subcategory ? product.subcategory.name : "—"
    end
    column :status
    column :image do |product|
      if product.image.attached?
        image_tag url_for(product.image), height: "50"
      else
        "No image"
      end
    end
    actions
  end

  controller do
    include Rails.application.routes.url_helpers
  end
end
