class LettersController < ApplicationController
  def index
    @important_letters = Letter.where(genre_id: 4).order(updated_at: :desc).limit(2)
    @monthly_letters = Letter.where(genre_id: 2).order(updated_at: :desc).limit(1)
    @menu_letters = Letter.where(genre_id: 3).order(updated_at: :desc).limit(1)
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.valid?
      @letter.save
    end
  end

  private

  def letter_params
    params.permit(:title, :genre)
  end
end
