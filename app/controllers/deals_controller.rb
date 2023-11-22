class DealsController < ApplicationController
  def new
    @deal = Deal.new
    @categories = Category.where(author: current_user)
  end

  def create
    @deal = Deal.new(deal_params)
    @deal.author = current_user
    
    # it contains a many to many relationship and joins table between deals and categories
    @deal.categories = Category.where(id: params[:category])

    if @deal.save
      redirect_to category_path(Category.find_by(id: params[:category]))
    else
      render :new
    end
  end

  private

  def deal_params
    params.require(:deal)
          .permit(:name, :amount)
  end
end
