class GigsController < ApplicationController
  before_action :set_gig, except: [:index, :new, :create, :all_gigs]
  before_action :authenticate_user!, except: [:show, :all_gigs]
  before_action :is_authorised, only: [:listing, :description, :logistics, :compensation, :update]

  def index
    @gigs = current_user.gigs
  end

  def new
    @gig = current_user.gigs.build
  end


  def create
    @gig = current_user.gigs.build(gig_params)
    if @gig.save
      redirect_to listing_gig_path(@gig), notice: "Begin"
    else
      flash[:alert] = "Cannot add gig to community. Something went wrong..."
      render :new
    end
  end

  def show
  end

  def all_gigs
    @gigs = Gig.where(active: true).order(created_at: :desc)
  end

  def listing
  end

  def description
  end

  def logistics
  end

  def compensation
  end

  def update
    new_params = gig_params
    new_params = gig_params.merge(active: true) if is_ready_gig

    if @gig.update(gig_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  private
    def set_gig
      @gig = Gig.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission to edit this page" unless current_user.id == @gig.user_id
    end

    def is_ready_gig
      !@gig.active && !@gig.compensation.blank? && !@gig.location.blank? && !@gig.title.blank?
    end

    def gig_params
      params.require(:gig).permit(:category, :title, :description, :location, :date, :time, :personnel_count, :compensation, :additional_details, :active)
    end

end
