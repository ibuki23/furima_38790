class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :items
         has_many :buys

         validates :nickname,             presence: true
         validates :email,                presence: true
         validates :encrypted_password,   presence: true
         validates :birthday,             presence: true
         validates :family_name,          presence: true
         validates :first_name,           presence: true
         validates :family_name_furigana, presence: true
         validates :first_name_furigana,  presence: true
         validates :encrypted_password,   length: { minimum: 6 }
end
