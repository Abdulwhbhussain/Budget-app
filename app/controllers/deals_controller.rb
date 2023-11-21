class DealsController < ApplicationController

  def new
    @user = current_user
    @deal = @user.deals.new
  end

  def create
    @user = current_user
    @deal = @user.deals.new(deal_params)
    
    if @deal.save
      redirect_to category_path(@category)
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
