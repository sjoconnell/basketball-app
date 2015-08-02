class ProfilesController < ApplicationController
  before_action :authenticate_profile_user, only: [:edit, :update, :destroy]
  before_action :authenticate_profile_maker, only: [:new, :create]
  
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find_by(id: params[:id])
    @joinedgames = GamedUser.where(user_id: @profile.user_id)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(first_name: params[:first_name], last_name: params[:last_name], height: params[:height], position: params[:position], experience: params[:experience], user_id: current_user.id)
    if @profile.save
      redirect_to "/profiles/#{@profile.id}"
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end

  def update
    @profile = Profile.find_by(id: params[:id])
    if @profile.update(first_name: params[:first_name], last_name: params[:last_name], height: params[:height], position: params[:position], experience: params[:experience])
    redirect_to "/profiles/#{@profile.id}"
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find_by(id: params[:id])
    @profile.destroy
    redirect_to "/profiles/new"
  end
end
