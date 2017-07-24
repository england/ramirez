class PublicController < ApplicationController
  before_action do
    @user = User.find_by_uuid(params[:uuid]) or render json: { uuid: ["Not found"] }, status: :not_found
  end

  before_action do
    unless params[:amount].to_i > 0
      render json: { amount: ["Only refills are allowed"] }, status: :unprocessable_entity
    end
  end

  def refill
    transaction = @user.transactions.new(amount: params[:amount], comment: "Refill via external service")

    if transaction.save
      render json: {}, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end
end
