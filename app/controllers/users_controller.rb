class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_set, only: [:index]
  def index
  end

  def show
    if nursery_user?
      @user = User.find(params[:id])
      @kids = Kid.where(user_id: params[:id])
    elsif params[:id] != current_user.id.to_s
      redirect_to root_path
    else
      @user = User.find(current_user.id)
      @kids = Kid.where(user_id: current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to action: 'index'
  end

  def admit
    @user = User.find(params[:id])
    @user.permission = true
    @user.save
    redirect_to action: 'index'
  end

  private

  def nursery_user?
    current_user.authority_id == 3
  end

  def user_set
    case current_user.authority_id
    when 2, 4
      @users = User.where(id: current_user.id)
    when 3
      @users = User.order(:authority_id, id: :desc)
    else
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :authority_id,
      :postal_code,
      :pref,
      :city,
      :town,
      :building,
      :phone_number,
      :permission
    )
  end
end
