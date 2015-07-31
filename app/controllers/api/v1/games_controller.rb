class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.where(status: "open")
  end
end
