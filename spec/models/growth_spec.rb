require 'rails_helper'

RSpec.describe Growth, type: :model do
  before do
    @kid = FactoryBot.create(:kid)
    @growth = FactoryBot.build(:growth)
    @growth.kid_id = @kid.id
  end

  describe '成長記録' do
    context '成長記録が登録できるとき' do
      it '全ての情報があれば、登録できる' do
        expect(@growth).to be_valid
      end
    end

    context '成長記録が登録できないとき' do
      it '登録月情報がないとき、登録できない' do
        @growth.month = ''
        @growth.valid?
        expect(@growth.errors.full_messages).to include("Month can't be blank")
      end
      it '測定日情報がないとき、登録できない' do
        @growth.inspection_date = nil
        @growth.valid?
        expect(@growth.errors.full_messages).to include("Inspection date can't be blank")
      end
      it '体重情報がないとき、登録できない' do
        @growth.weight = nil
        @growth.valid?
        expect(@growth.errors.full_messages).to include("Weight can't be blank")
      end
      it '体重情報が2以下のとき、登録できない' do
        @growth.weight = 2
        @growth.valid?
        expect(@growth.errors.full_messages).to include('Weight 体重は2kgより大きい値を登録してください')
      end
      it '体重情報が30以上のとき、登録できない' do
        @growth.weight = 30
        @growth.valid?
        expect(@growth.errors.full_messages).to include('Weight 体重は30kgより小さい値を登録してください')
      end
      it '身長情報がないとき、登録できない' do
        @growth.height = nil
        @growth.valid?
        expect(@growth.errors.full_messages).to include("Height can't be blank")
      end
      it '身長情報が40以下のとき、登録できない' do
        @growth.height = 40
        @growth.valid?
        expect(@growth.errors.full_messages).to include('Height 身長は40cmより大きい値を登録してください')
      end
      it '身長情報が200以上のとき、登録できない' do
        @growth.height = 200
        @growth.valid?
        expect(@growth.errors.full_messages).to include('Height 身長は200cmより小さい値を登録してください')
      end
    end
  end
end
