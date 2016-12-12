class UsersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def new
    @user = User.new
    if session[:user_id]
      redirect_to new_game_path
    end
  end

  def create
    p params
    @user = User.find_or_create_by(user_params)
    if @user.persisted?
      puts "YAYAYAYAAY"
      session[:user_id] = @user.id
      redirect_to new_game_path
    else
      puts "NONONONONO"
      puts @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end


end
