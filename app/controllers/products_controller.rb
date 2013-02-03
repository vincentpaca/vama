class ProductsController < ApplicationController
  def index
    if params[:model].present?
      @title = Category.find(params[:model]).name
      @products = Product.active.where(:category_id => params[:model])
    else
      @title = "Products"
      @products = Product.active
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
