class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true
  validates :profile, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shippingarea_id, presence: true
  validates :shippingcharge_id, presence: true
  validates :daystoship_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }

  validates_inclusion_of :category_id, in: 1..10
  validates_inclusion_of :status_id, in: 1..6
  validates_inclusion_of :shippingarea_id, in: 1..47
  validates_inclusion_of :shippingcharge_id, in: 1..2
  validates_inclusion_of :daystoship_id, in: 1..3
  validates_inclusion_of :price, in: 300..9_999_999
end
