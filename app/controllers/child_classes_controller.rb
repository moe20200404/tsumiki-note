class ChildClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :nursery_user!

  def index
    @child_classes = ChildClass.order(class_age: "ASC")
  end

  def new
    @child_classes = ChildClass.order(class_age: "ASC")
    @child_class = ChildClass.new
  end
  
  def create
    @child_classes = ChildClass.order(class_age: "ASC")

    @child_class = ChildClass.new(child_class_params)
    if @child_class.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @child_classes = ChildClass.order(class_age: "ASC")
    @child_class = ChildClass.find(params[:id])
  end

  def update
    @child_classes = ChildClass.order(class_age: "ASC")
    @child_class = ChildClass.find(params[:id])
    if @child_class.update(child_class_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @child_class= ChildClass.find(params[:id])
    @child_class.destroy
    redirect_to action: 'index'
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
