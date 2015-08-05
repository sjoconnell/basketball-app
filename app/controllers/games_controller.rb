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
    coordinates = Geocoder.coordinates(params[:address])
    @game = Game.new(title: params[:title], address: params[:address], start_time: params[:game][:start_time], end_time: params[:game][:end_time], players_joined: 1, players_allowed: params[:players_allowed], latitude: coordinates[0], longitude: coordinates[1], description: params[:description], status: "open", user_id: current_user.id)
    if @game.save
      GamedUser.create(user_id: current_user.id, game_id: @game.id)
      flash[:success] = "Game Created"
      redirect_to "/games/#{@game.id}"
    else
      render :new
    end
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    coordinates = Geocoder.coordinates(params[:address])
    @game = Game.find_by(id: params[:id])
    if @game.update(title: params[:title], address: params[:address], start_time: params[:game][:start_time], end_time: params[:game][:end_time], players_allowed: params[:players_allowed], description: params[:description], latitude: coordinates[0], longitude: coordinates[1] )
      flash[:warning] = "Game Updated"
    redirect_to "/games/#{@game.id}"
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    usersjoined = GamedUser.where(game_id: @game.id)
    usersjoined.each do |user|
      user.destroy
    end
    @game.destroy
    flash[:danger] = "Game Deleted"
    redirect_to "/"
  end
end
