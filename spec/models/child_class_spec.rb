require 'rails_helper'

RSpec.describe ChildClass, type: :model do
  before do
    @child_class = FactoryBot.build(:child_class)
  end

  context 'クラス登録できる時' do
    it 'クラスの年齢とクラスの名前があると登録できる' do
      expect(@child_class).to be_valid
    end
  end

 
  context 'クラス登録できない時' do
    it 'クラスの年齢がないと登録できない' do
      @child_class.class_age = ""
      @child_class.valid?
      expect(@child_class.errors.full_messages).to include("Class age can't be blank")
    end
    it 'クラスの年齢が既に存在すると登録できない' do
      @child_class.save
      @another_class = FactoryBot.build(:child_class)
      @another_class.class_age = @child_class.class_age
      @another_class.valid?
      expect(@another_class.errors.full_messages).to include("Class age has already been taken")
    end
    it 'クラスの年齢が1桁より大きいと登録できない' do
      @child_class.class_age = "23"
      @child_class.valid?
      expect(@child_class.errors.full_messages).to include("Class age input only 1 digit")
    end
    it 'クラスの名前がないと登録できない' do
      @child_class.class_name = ""
      @child_class.valid?
      expect(@child_class.errors.full_messages).to include("Class name can't be blank")
    end
    it 'クラスの名前が既に存在すると登録できない' do
      @child_class.save
      @another_class = FactoryBot.build(:child_class)
      @another_class.class_name = @child_class.class_name
      @another_class.valid?
      expect(@another_class.errors.full_messages).to include("Class name has already been taken")
    end
  end

end



