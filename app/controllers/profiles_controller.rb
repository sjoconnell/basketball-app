class ProfilesController < ApplicationController
  before_action :authenticate_profile_user, only: [:edit, :update, :destroy]
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find_by(id: params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(first_name: params[:first_name], last_name: params[:last_name], height: params[:height], position: params[:position], experience: params[:experience], user_id: current_user.id)
    redirect_to "/profiles/#{@profile.id}"
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end

  def update
    @profile = Profile.find_by(id: params[:id])
    @profile.update(first_name: params[:first_name], last_name: params[:last_name], height: params[:height], position: params[:position], experience: params[:experience])
    redirect_to "/profiles/#{@profile.id}"
  end

  def destroy
    @profile = Profile.find_by(id: params[:id])
    @profile.destroy
    redirect_to "/profiles/new"
  end
end
