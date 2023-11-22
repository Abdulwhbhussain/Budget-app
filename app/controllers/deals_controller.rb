class DealsController < ApplicationController
  def new
    @deal = Deal.new
    @categories = Category.where(author: current_user)
  end

  def create
    @deal = current_user.deals.new(deals_params.except(:category_ids))
    @deal.author = current_user
    @categories = Category.where(id: deals_params[:category_ids])
    @categories.each do |category|
      @deal.categories << category
    end
    if @deal.save
      flash[:success] = 'Successfully added New Expenditure.'
      redirect_to category_path(Category.find_by(id: @categories.first.id))
    else
      flash.now[:error] = 'Error: Failed to Add new Expenditure!'
      render :new
    end
  end

  private

  def deals_params
    params.require(:deal).permit(:name, :amount, category_ids: [])
  end
end
