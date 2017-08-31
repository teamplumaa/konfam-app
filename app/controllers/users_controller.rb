class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items
    @services = @user.services
    @gigs = @user.gigs
  end
end
