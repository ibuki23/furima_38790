require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", encrypted_password: "00000000", password_confirmation: "00000000",birthday: "2000/2/20",
         family_name: "adati", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "satosi")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", encrypted_password: "00000000", password_confirmation: "00000000", birthday: "2000/2/20",
         family_name: "adati", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "satosi")
   user.valid?
   expect(user.errors.full_messages).to include("Email can't be blank")
    end

    
    it "encrypted_passwordが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "", password_confirmation: "00000000", birthday: "2000/2/20",
         family_name: "adati", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "satosi")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "birthdayが空では登録できない" do
      user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "00000000", password_confirmation: "00000000", birthday: "",
         family_name: "adati", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "satosi")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

      it "family_nameが空では登録できない" do
        user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "00000000", password_confirmation: "00000000", birthday: "2000/2/20",
           family_name: "", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "satosi")
        user.valid?
        expect(user.errors.full_messages).to include("Family name can't be blank")
  end

  it "first_nameが空では登録できない" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "00000000", password_confirmation: "00000000", birthday: "2000/2/20",
       family_name: "adati", first_name: "", family_name_furigana: "adati", first_name_furigana: "satosi")
    user.valid?
    expect(user.errors.full_messages).to include("First name can't be blank")
  end

  it "family_name_furiganaが空では登録できない" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "00000000", password_confirmation: "00000000", birthday: "2000/2/20",
       family_name: "adati", first_name: "satosi", family_name_furigana: "", first_name_furigana: "satosi")
    user.valid?
    expect(user.errors.full_messages).to include("Family name furigana can't be blank")
  end

  it "first_name_furiganaが空では登録できない" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "00000000", password_confirmation: "00000000", birthday: "2000/2/20",
       family_name: "adati", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "")
    user.valid?
    expect(user.errors.full_messages).to include("First name furigana can't be blank")
  end
  it "password_confirmationがencrypted_passwordと一致しなければ登録できない" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "00000000", password_confirmation: "11111111", birthday: "2000/2/20",
       family_name: "adati", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "satosi")
    user.valid?
    expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it "encrypted_passwordが6文字以上でなければ登録できない" do
    user = User.new(nickname: "abe", email: "kkk@gmail.com", encrypted_password: "0000", password_confirmation: "00000000", birthday: "2000/2/20",
       family_name: "adati", first_name: "satosi", family_name_furigana: "adati", first_name_furigana: "satosi")
    user.valid?
    expect(user.errors.full_messages).to include("Encrypted password is too short (minimum is 6 characters)")
  end
 end
end