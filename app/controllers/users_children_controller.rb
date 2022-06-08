class UsersChildrenController < ApplicationController
  before_action :set_child

  def index
  end

  def new
    @users_child = UsersChild.new
  end

  def create
    @users_child = UsersChild.new(child_params)
    if @users_child.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

private

  def set_child
    case current_user.authority_id
    when 2 , 4
      @users_children = UsersChild.where(user_id: current_user.id)
    when 3
      @users_children = UsersChild.all
    else
      redirect_to root_path
    end
  end

  def child_params
    params.require(:users_child).permit(
      :name, :birth_date, :gender_id, :start_month, :child_class_id, :user_id
    )
  end

end
