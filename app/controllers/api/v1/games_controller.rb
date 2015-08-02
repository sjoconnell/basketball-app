class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.where("status = 'open' AND end_time > ?", Time.now)
  end
end
