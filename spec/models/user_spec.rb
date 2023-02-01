require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmationとfamily_nameとfirst_name
とfamily_name_furiganaとfirst_name_furiganaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

       it "family_nameが空では登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

       it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

 it "family_name_furiganaが空では登録できない" do
        @user.family_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
      end

       it "first_name_furiganaが空では登録できない" do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

 it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdefg'        
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

 it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'        
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'abc123あいう'        
        @user.password_confirmation = 'abc123あいう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

 it "family_nameに半角文字が含まれていると登録できない" do
        @user.family_name = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

       it "first_nameに半角文字が含まれていると登録できない" do
        @user.first_name = 'takasi'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

 it "family_name_furiganaにカタカナ以外の文字が含まれていると登録できない" do
        @user.family_name_furigana = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furigana is invalid")
      end

       it "first_name_furiganaにカタカナ以外の文字が含まれていると登録できない" do
        @user.first_name_furigana = 'takasi'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

     it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end
