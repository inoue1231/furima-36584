class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :myouji, presence: true
         validates :name, presence: true
         validates :myouji_kana, presence: true
         validates :name_kana, presence: true
         validates :birth_date, presence: true


end
