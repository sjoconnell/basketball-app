class Api::V1::GamedUsersController < ApplicationController
  def index
    @gamedusers = GamedUser.all
  end
end
