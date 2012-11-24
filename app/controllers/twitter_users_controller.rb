class TwitterUsersController < ApplicationController
  respond_to :json

  def show
    respond_with TwitterUser.where(:username => params[:id]).first
  end
end
