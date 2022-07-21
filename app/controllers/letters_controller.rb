class LettersController < ApplicationController
  before_action :authenticate_user!
  before_action :nursery_user!, except: [:index, :show]

  def index
    if current_user.permission 
      @important_letters = Letter.where(genre_id: 4).order(updated_at: :desc).limit(6)
      @monthly_letters = Letter.where(genre_id: 2).order(updated_at: :desc).limit(6)
      @menu_letters = Letter.where(genre_id: 3).order(updated_at: :desc).limit(6)
    end
  end

  def show
    @letters = Letter.where(genre_id: params[:id])
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def update
    @letter = Letter.find(params[:id])
    if @letter.update(letter_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
    redirect_to root_path
  end

  private
  def nursery_user!
    redirect_to root_path if current_user.authority_id != 3
  end

  def letter_params
    params.require(:letter).permit(:title, :genre_id, :pdf_file).merge(user_id: current_user.id)
  end
end
