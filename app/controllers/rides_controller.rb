class RidesController < ApplicationController

  def create
    ride = Ride.new
    ride.attraction_id = params[:attraction]
    ride.user_id = session[:user_id]
    ride.save
    result = ride.take_ride
    redirect_to user_path(session[:user_id]), :flash => {:alert => result}
  end
end
