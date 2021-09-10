class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :name, presence: true
  validates :profile, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { only_integer: true }, inclusion: { in: 1..10 }
  validates :status_id, numericality: { only_integer: true }, inclusion: { in: 1..6 }
  validates :shippingarea_id, numericality: { only_integer: true }, inclusion: { in: 1..47 }
  validates :shippingcharge_id, numericality: { only_integer: true }, inclusion: { in: 1..2 }
  validates :daystoship_id, numericality: { only_integer: true }, inclusion: { in: 1..3 }
  validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9999999 }



end
