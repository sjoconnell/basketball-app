class GamesController < ApplicationController
  before_action :authenticate_game_user, only: [:edit, :update, :destroy]
  before_action :authenticate_game_maker, only: [:new, :create]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(id: params[:id])
    @joinedusers = GamedUser.where(game_id: @game.id)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(title: params[:title], address: params[:address], start_time: params[:start_time], end_time: params[:end_time], players_joined: 1, players_allowed: params[:players_allowed], description: params[:description], status: "open", user_id: current_user.id)
    redirect_to "/games/#{@game.id}"
    GamedUser.create(user_id: current_user.id, game_id: @game.id)
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.update(title: params[:title], address: params[:address], start_time: params[:start_time], end_time: params[:end_time], description: params[:description] )
    redirect_to "/games/#{@game.id}"
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    usersjoined = GamedUser.where(game_id: @game.id)
    usersjoined.each do |user|
      user.destroy
    end
    @game.destroy
    redirect_to "/"
  end
end
