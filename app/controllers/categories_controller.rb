class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category created successfully."
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category updated."
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find_by(slug: params[:id])
  end

end
