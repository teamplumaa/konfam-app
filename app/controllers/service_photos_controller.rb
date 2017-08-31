class ServicePhotosController < ApplicationController

  def create
    @service = Service.find(params[:service_id])

    if params[:images]
      params[:images].each do |img|
        @service.service_photos.create(image: img)
      end

      @services = @service.service_photos
      redirect_back(fallback_location: request.referer, notice: "Saved")
    end
  end

  def destroy
    @service_photo = ServicePhoto.find(params[:id])
    @service = @service_photo.service

    @service_photo.destroy
    @service_photos = ServicePhoto.where(service_id: @service.id)

    respond_to :js
  end
end
