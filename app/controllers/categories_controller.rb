class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = @user.categories.includes(:deals)
  end

  def new
    @user = current_user
    @category = @user.categories.new
  end

  def create
    @user = current_user
    @category = @user.categories.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @category = @user.categories.includes(:deals).find(params[:id])
  end

  private

  def category_params
    params.require(:category)
      .permit(:name, :icon)
  end
end
