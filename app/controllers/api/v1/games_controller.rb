class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all
  end
end
