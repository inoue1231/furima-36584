class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchases_address = PurchasesAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchases_address = PurchasesAddress.new(purchases_params)
    if @purchases_address.valid?
      pay_item
      @purchases_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchases_params
    params.require(:purchases_address).permit(:municipalities, :address, :postal_code, :building_name, :telephone_number, :shippingarea_id, :purchase_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchases_params[:token],
      currency: 'jpy'
    )
  end
end
