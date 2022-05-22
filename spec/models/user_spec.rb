require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it 'すべての登録情報があれば登録できる' do
        expect(@user).to be_valid
      end

      it 'building情報がなくても、他のすべての登録情報があれば登録できる' do
        @user.building = ''
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき' do
      it '名前の入力がないと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it '権限IDの入力がないと登録できない' do
        @user.authority_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Authority can't be blank")
      end

      it '郵便番号の入力がないと登録できない' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が6桁では登録できない' do
        @user.postal_code = Faker::Number.leading_zero_number(digits: 6)
        @user.valid?
        expect(@user.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が8桁では登録できない' do
        @user.postal_code = Faker::Number.leading_zero_number(digits: 8)
        @user.valid?
        expect(@user.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県情報がないと登録できない' do
        @user.pref = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Pref can't be blank")
      end

      it '市の情報がないと登録できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end

      it '町の情報がないと登録できない' do
        @user.town = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Town can't be blank")
      end

      it '電話番号の入力がないと登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号の入力が9桁では登録できない' do
        @user.phone_number = Faker::Number.leading_zero_number(digits: 9)
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end

      it '電話番号の入力が12桁で登録できない' do
        @user.phone_number = Faker::Number.leading_zero_number(digits: 12)
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it '電話番号は文字では登録できない' do
        @user.phone_number = Faker::Lorem.characters(number: 10)
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number input only number')
      end
    end
  end
end
