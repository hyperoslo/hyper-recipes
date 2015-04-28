class UsersController < ApplicationController
  before_action :authenticate, only: [:destroy]

  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors.messages, status: :bad_request
    end
  end

  def destroy
    @user = @current_user
    if account_owner?(@user)
      @user.destroy
      head :ok
    else
      head :unauthorized
    end
  end

private
  def account_owner?(user)
    params[:id].to_i == user.id
  end
end
