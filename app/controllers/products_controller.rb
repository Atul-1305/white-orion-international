class ProductsController < ApplicationController
  def index
    @categories = Category.includes(:subcategories, :direct_products, :sub_products).where(status: true)

    @selected_category = Category.find_by(id: params[:category_id])

    if @selected_category.nil?
      @selected_category = @categories.find do |category|
        category.direct_products.exists? || category.sub_products.exists?
      end
    end

    @selected_subcategory = Subcategory.find_by(id: params[:subcategory_id])

    if @selected_subcategory
      @products = @selected_subcategory.products
    elsif @selected_category
      direct_products = @selected_category.direct_products
      subcategory_products = @selected_category.sub_products
      @products = Product.where(id: direct_products.select(:id))
                         .or(Product.where(id: subcategory_products.select(:id)))
    else
      @products = Product.none
    end
  end

  def show
    # eager-load ActiveStorage attachments to avoid extra queries in views
    @product = Product.includes(image_attachment: :blob).find(params[:id])
    @related_products = Product.includes(image_attachment: :blob)
                              .where(category_id: @product.category_id)
                              .where.not(id: @product.id)
                              .limit(4)
  end
end
