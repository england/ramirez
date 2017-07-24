class TransactionsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]

  def index
    @transactions = @user.transactions.order(:id)
  end

  def new
    @transaction = Transaction.new(amount: 0)
  end

  def create
    @transaction = @user.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to user_transactions_path(user_id: @user.id), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def transaction_params
      params.require(:transaction).permit(:amount, :comment)
    end
end
