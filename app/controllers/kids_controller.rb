class KidsController < ApplicationController
  before_action :authenticate_user!
  before_action :nursery_user!, except: [:show]
  before_action :set_kids, only: [:index]

  def index
  end

  def new
    @kid = Kid.new(start_month: Date.today.next_month(1).strftime('%Y年%m月').to_s)
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

  def show
    if nursery_user?
      @kid = Kid.find(params[:id])
      @growths = Growth.where(kid_id: params[:id]).order(month: :desc)
    elsif users_kid?
      @growths = Growth.where(kid_id: params[:id]).order(month: :desc)
    else
      redirect_to user_path(id: current_user.id)
    end
  end

  private

  def nursery_user!
    redirect_to root_path if current_user.authority_id != 3
  end


  def nursery_user?
    current_user.authority_id == 3
  end

  def set_kids
    case current_user.authority_id
    when 2, 4
      @kids = Kid.where(user_id: current_user.id)
    when 3
      @kids = Kid.order(birth_date: :desc)
    else
      redirect_to root_path
    end
  end

  def users_kid?
    @kid = Kid.find(params[:id])
    if @kid.user_id == current_user.id
      true
    else
      false
    end
  end

  def kid_params
    params.require(:kid).permit(
      :name, :birth_date, :gender_id, :start_month, :end_month, :grade_id, :user_id
    )
  end
end
