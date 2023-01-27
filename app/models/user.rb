class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
         validates :nickname,             presence: true
         validates :birthday,             presence: true
         validates :family_name,          presence: true
         validates :first_name,           presence: true
         validates :family_name_furigana, presence: true
         validates :first_name_furigana,  presence: true

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }

         VALID_FAMILY_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
         validates :family_name, format: { with: VALID_FAMILY_NAME_REGEX }
         
         VALID_FIRST_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
         validates :first_name, format: { with: VALID_FIRST_NAME_REGEX }

         VALID_FAMILY_NAME_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
         validates :family_name_furigana, format: { with: VALID_FAMILY_NAME_FURIGANA_REGEX }

         VALID_FIRST_NAME_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
         validates :first_name_furigana, format: { with: VALID_FIRST_NAME_FURIGANA_REGEX }

end
