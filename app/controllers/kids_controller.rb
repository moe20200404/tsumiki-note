class KidsController < ApplicationController
  before_action :set_kids

  def index
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    if @kid.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def edit
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    if @kid.update(kid_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy
    redirect_to action: 'index'
  end

  private

  def set_kids
    case current_user.authority_id
    when 2, 4
      @kids = Kid.where(user_id: current_user.id)
    when 3
      @kids = Kid.all
    else
      redirect_to root_path
    end
  end

  def kid_params
    params.require(:kid).permit(
      :name, :birth_date, :gender_id, :start_month, :end_month, :grade_id, :user_id
    )
  end
end
