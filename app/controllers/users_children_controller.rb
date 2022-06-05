class UsersChildrenController < ApplicationController
  before_action :set_child

  def index
  end

  def new
    binding.pry
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
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
      binding.pry
      redirect_to root_path
    end
  end

end
