class ChildClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :nursery_user!

  def index
    @child_classes = ChildClass.all
  end

  def new
    @child_class = ChildClass.new
  end
  
  def create
    @child_class = ChildClass.new(child_class_params)
    if @child_class.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @child_class = ChildClass.find(params[:id])
  end

  def update
    @child_class = ChildClass.find(params[:id])
    if @child_class.update(child_class_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  private

  def nursery_user!
    if !current_user.authority_id == 3
      redirect_to root_path
    end
  end

  def child_class_params
    params.require(:child_class).permit(:class_age, :class_name)
  end
end
