class Api::V1::ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end
end
