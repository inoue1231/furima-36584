class PurchasesAddress
  include ActiveModel::Model
  attr_accessor :municipalities, :address, :postal_code, :building_name, :telephone_number, :shippingarea_id, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :address
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :telephone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :municipalities
    validates :token
  end

  validates :shippingarea_id, numericality: { other_than: 0, message: "を選択してください" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Address.create(municipalities: municipalities, address: address, postal_code: postal_code, building_name: building_name, telephone_number: telephone_number,
                   shippingarea_id: shippingarea_id, purchase_id: purchase.id)
  end
end
