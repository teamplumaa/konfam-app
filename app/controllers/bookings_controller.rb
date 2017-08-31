class BookingsController < ApplicationController
  before_action :authenticate_user!
  def create
    service = Service.find(params[:service_id])

    if current_user == service.user
      flash[:alert] = "Oga/Madam you cannot hire yourself"

    else
      @booking = current_user.bookings.build(booking_params)
      @booking.service = service
      @booking.total = (@booking.offer * 1.2)
      @booking.save

        flash[:notice] = "Successfully Booked Service!"
    end
      redirect_to service
  end

  def your_requests
    @requests = current_user.bookings.order(booking_date: :asc)
  end

  def your_offers
    @services = current_user.services
  end

  private
    def booking_params
      params.require(:booking).permit(:booking_date, :offer)
    end
end
