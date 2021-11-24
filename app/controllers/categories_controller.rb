class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, success: "Catégorie modifiée avec succès"
    else
      render 'edit'
    end
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.valid?
      category.save
      redirect_to categories_path, success: "Catégorie ajoutée avec succès"
    else
      @category = category
      render 'new'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: "Catégorie supprimée avec succès"
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
