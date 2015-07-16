class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_game_user
    unless user_signed_in? && current_user.id == Game.find_by(id: params[:id]).user_id
      redirect_to "/games/#{params[:id]}"
    end
  end

  def authenticate_profile_user
    unless user_signed_in? && current_user.id == Profile.find_by(id: params[:id]).user_id
      redirect_to "/profiles/#{params[:id]}"
    end
  end

end
