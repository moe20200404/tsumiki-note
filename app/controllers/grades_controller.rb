class GradesController < ApplicationController
  before_action :authenticate_user!
  before_action :nursery_user!
  before_action :set_grades, only: [:index, :new, :create, :edit, :update]

  def index
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    redirect_to action: 'index'
  end

  private

  def nursery_user!
    redirect_to root_path if current_user.authority_id != 3
  end

  def grade_params
    params.require(:grade).permit(:age, :name)
  end

  def set_grades
    @grades = Grade.order(age: 'ASC')
  end
end
