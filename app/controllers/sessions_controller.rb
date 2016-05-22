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
    if !session[:user_id].nil?
      session.delete :user_id
      redirect_to root_path
    end
  end

private
  def session_params
    params.require(:user).permit(:id)
  end
end
