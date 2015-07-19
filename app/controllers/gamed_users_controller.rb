class GamedUsersController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    GamedUser.create(user_id: current_user.id, game_id: params[:game_id])
    redirect_to "/games/#{params[:game_id]}"
  end

  def edit

  end

  def update

  end

  def destroy
    @gamed_user = GamedUser.find_by(:id => params[:id])
    @gamed_user.destroy
    redirect_to "/"
  end
end
