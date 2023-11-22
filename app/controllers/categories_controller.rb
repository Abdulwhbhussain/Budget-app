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
    # The `includes` method is used to avoid the N+1 query problem.
    @category = @user.categories.includes(:deals).find(params[:id])
    @deals = @category.deals
    # order deals by most recent first
    @deals = @deals.order(created_at: :desc)
  end

  private

  def category_params
    params.require(:category)
      .permit(:name, :icon)
  end
end
