require 'rails_helper'

RSpec.describe Letter, type: :model do
  before do
    @letter = FactoryBot.build(:letter)
  end

  context 'おたより登録できる時' do
    it 'タイトル・ジャンル・ユーザーIDが存在し、かつ、pdfファイルがあると登録できる。' do
      expect(@letter).to be_valid
    end
  end
  context 'おたより登録できない時' do
    it 'タイトルが空だと登録できない' do
      @letter.title = ''
      @letter.valid?
      expect(@letter.errors.full_messages).to include("Title can't be blank")
    end
    it 'ジャンルが空だと登録できない' do
      @letter.genre_id = 1
      @letter.valid?
      expect(@letter.errors.full_messages).to include("Genre can't be blank")
    end
    it 'ユーザーIDが空だと登録できない' do
      @letter.user = nil
      @letter.valid?
      expect(@letter.errors.full_messages).to include('User must exist')
    end
    it 'pdfファイルがないと登録できない' do
      @letter.pdf_file = nil
      @letter.valid?
      expect(@letter.errors.full_messages).to include("Pdf file can't be blank")
    end
  end
end
