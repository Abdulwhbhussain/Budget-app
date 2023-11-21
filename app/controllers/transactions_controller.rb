class TransactionsController < ApplicationController
  def index
    @user = current_user
    # find all transactions for the given category of the current user
    @transactions = @user.transactions.where(category_id: params[:category_id])
  end

  def new
    @user = current_user
    # find the category for the given category_id
    @category = @user.categories.find(params[:category_id])
    # create a new transaction for the given category
    @transaction = @category.transactions.new
  end

  def create
    @user = current_user
    # find the category for the given category_id
    @category = @user.categories.find(params[:category_id])
    # create a new transaction for the given category
    @transaction = @category.transactions.new(transaction_params)

    if @transaction.save
      redirect_to category_transactions_path(@category)
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
