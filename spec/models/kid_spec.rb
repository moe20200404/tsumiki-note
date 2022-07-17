require 'rails_helper'

RSpec.describe Kid, type: :model do
  before do
    @kid = FactoryBot.build(:kid)
    sleep 0.1
  end

  describe '園児新規登録' do
    context '園児の登録ができるとき' do
      it '全ての情報があれば登録できる' do
        expect(@kid).to be_valid
      end
      it '退園月（end_month）情報がなくても、他のすべての登録情報があれば登録できる' do
        @kid.end_month = ''
        expect(@kid).to be_valid
      end
    end
    context '園児の登録ができないとき' do
      it '名前の入力がないと登録できない' do
        @kid.name = ''
        @kid.valid?
        expect(@kid.errors.full_messages).to include("Name can't be blank")
      end
      it '誕生日の入力がないと登録できない' do
        @kid.birth_date = ''
        @kid.valid?
        expect(@kid.errors.full_messages).to include("Birth date can't be blank")
      end
      it '性別の入力がないと登録できない' do
        @kid.gender_id = 1
        @kid.valid?
        expect(@kid.errors.full_messages).to include("Gender can't be blank")
      end
      it '入園月の入力がないと登録できない' do
        @kid.start_month = ''
        @kid.valid?
        expect(@kid.errors.full_messages).to include("Start month can't be blank")
      end
      it '入園月のフォームが正しくないと登録できない' do
        @kid.start_month = '202204'
        @kid.valid?
        expect(@kid.errors.full_messages).to include("Start month input correctly")
      end
      it 'クラス情報がないと登録できない' do
        @kid.grade = nil
        @kid.valid?
        expect(@kid.errors.full_messages).to include('Grade must exist')
      end

      it '保護者ユーザーの情報がないと登録できない' do
        @kid.user = nil
        @kid.valid?
        expect(@kid.errors.full_messages).to include('User must exist')
      end
    end
  end
end
