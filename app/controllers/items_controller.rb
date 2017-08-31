class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :konfam_market]
  before_action :authenticate_user!, except: [:show, :konfam_market]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :details, :update]

  def index
    @items = current_user.items
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to listing_item_path(@item), notice: "Saved..."
    else
      flash[:alert] = "Cannot add item to Konfam Market. Something went wrong..."
      render :new
    end
  end

  def show
    @photos = @item.photos
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def konfam_market
    @items = Item.where(active: true).order(created_at: :desc)
  end

  def photo_upload
    @photos = @item.photos
  end

  def details
  end

  def update
    new_params = item_params
    new_params = item_params.merge(active: true) if is_ready_item

    if @item.update(item_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission to edit this page" unless current_user.id == @item.user_id
    end

    def is_ready_item
      !@item.active && !@item.photos.blank? && !@item.price.blank? && !@item.summary.blank? && !@item.item_name.blank?
    end

    def item_params
      params.require(:item).permit(:category_type, :item_type, :item_name, :summary, :price, :quantity, :active)
    end
end
