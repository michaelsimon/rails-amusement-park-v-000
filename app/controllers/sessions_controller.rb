class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
  end

private
  def session_params
    params.require(:user).permit(:id)
  end
end
