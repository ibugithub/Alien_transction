class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories.all
  end

  def show
    @category = current_user.categories.find(params[:id])
    @expenses = @category.expenses.order(updated_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
