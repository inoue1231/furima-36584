class ItemsController < ApplicationController
  
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]


  def index
     @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @shippingcharge = Shippingcharge.find_by_id @item.shippingcharge_id
    @category = Category.find_by_id @item.category_id
    @status = Status.find_by_id @item.status_id
    @shippingarea = Shippingarea.find_by_id @item.shippingarea_id
    @daystoship = Daystoship.find_by_id @item.daystoship_id
   end
   
   def edit
    if @item.purchase.present?
      redirect_to root_path
    else
      render :edit
    end
    
  end
  
    def update    
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit
      end
    end

    def destroy
      if @item.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  
  

  private

  def item_params
    params.require(:item).permit(:name, :image, :profile, :category_id, :status_id, :shippingarea_id, :shippingcharge_id, :daystoship_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end
  
end