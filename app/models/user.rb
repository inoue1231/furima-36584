class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
         validates :myouji, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :myouji_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ }
         validates :name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/}
         validates :birth_date, presence: true
  

end
