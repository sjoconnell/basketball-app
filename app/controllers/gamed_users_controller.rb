class GamedUsersController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create
    GamedUser.create(user_id: current_user.id, game_id: params[:game_id])
    game = Game.find_by(id: params[:game_id])
    game.update(players_joined: game.players_joined + 1)
    if game.players_joined == game.players_allowed
      game.update(status: "full")
    end
    redirect_to "/games/#{params[:game_id]}"
  end

  def edit

  end

  def update

  end

  def destroy
    @gamed_user = GamedUser.find_by(:id => params[:id])
    game = Game.find_by(id: @gamed_user.game_id)
    @gamed_user.destroy
    game.update(players_joined: game.players_joined - 1)
    if game.status == "full"
      game.update(status: "open")
    end
    redirect_to "/"
  end
end
