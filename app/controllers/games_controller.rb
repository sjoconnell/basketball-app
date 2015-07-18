class GamesController < ApplicationController
  before_action :authenticate_game_user, only: [:edit, :update, :destroy]
  before_action :authenticate_game_maker, only: [:new, :create]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(title: params[:title], address: params[:address], start_time: params[:start_time], end_time: params[:end_time], description: params[:description], status: "open", user_id: current_user.id)
    redirect_to "/games/#{@game.id}"
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
    @game.destroy
    redirect_to "/"
  end
end
