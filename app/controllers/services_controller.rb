class ServicesController < ApplicationController
  before_action :set_service, except: [:index, :new, :create, :all_services]
  before_action :authenticate_user!, except: [:show, :all_services]
  before_action :is_authorised, only: [:listing, :description, :pricing, :photo_uploads, :details, :update]

  def index
    @services = current_user.services
  end

  def new
    @service = current_user.services.build
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      redirect_to listing_service_path(@service), notice: "Saved..Begin Adding details."
    else
      flash[:alert] = "Cannot add service to Konfam Market. Something went wrong..."
      render :new
    end
  end

  def show
    @service_photos = @service.service_photos
  end

  def all_services
    @services = Service.where(active: true).order(created_at: :desc)
  end

  def listing
  end

  def description
  end

  def pricing
  end

  def photo_uploads
    @service_photos = @service.service_photos
  end

  def details
  end

  def update
    new_params = service_params
    new_params = service_params.merge(active: true) if is_ready_service

    if @service.update(service_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission to edit this page" unless current_user.id == @service.user_id
    end

    def is_ready_service
      !@service.active && !@service.service_photos.blank? && !@service.pricing.blank? && !@service.address.blank? && !@service.title.blank?
    end

    def service_params
      params.require(:service).permit(:service_category, :address, :title, :pricing, :description, :city, :active)
    end
end
