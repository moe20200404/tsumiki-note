require 'rails_helper'

RSpec.describe Grade, type: :model do
  before do
    @grade = FactoryBot.build(:grade)
  end

  context 'クラス登録できる時' do
    it 'クラスの年齢とクラスの名前があると登録できる' do
      expect(@grade).to be_valid
    end
  end

  context 'クラス登録できない時' do
    it 'クラスの年齢がないと登録できない' do
      @grade.age = ''
      @grade.valid?
      expect(@grade.errors.full_messages).to include("Age can't be blank")
    end
    it 'クラスの年齢が1桁より大きいと登録できない' do
      @grade.age = '23'
      @grade.valid?
      expect(@grade.errors.full_messages).to include('Age input only 1 digit')
    end
    it 'クラスの名前がないと登録できない' do
      @grade.name = ''
      @grade.valid?
      expect(@grade.errors.full_messages).to include("Name can't be blank")
    end
    it 'クラスの名前が既に存在すると登録できない' do
      @grade.save
      @another_grade = FactoryBot.build(:grade)
      @another_grade.name = @grade.name
      @another_grade.valid?
      expect(@another_grade.errors.full_messages).to include('Name has already been taken')
    end
  end
end
