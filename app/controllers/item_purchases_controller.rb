class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    item = Item.find(params[:item_id])

    if current_user == item.user
      flash[:alert] = "Oga/Madam you cannot purchase your own item"

    else

      @item_purchase = current_user.item_purchases.build(item_purchase_params)
      @item_purchase.item = item
      @item_purchase.price = item.price
      @item_purchase.total = (item.price * 1.2) * @item_purchase.quantity
      @item_purchase.save

      flash[:notice] = "Successfully Purchased Item!"
    end
      redirect_to item

  end

  def your_purchases
    @purchases = current_user.item_purchases.order(created_at: :asc)
  end

  def your_orders
    @items = current_user.items
  end

  private

    def item_purchase_params
      params.require(:item_purchase).permit(:quantity)

    end

end
