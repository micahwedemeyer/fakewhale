class TweetsController < ApplicationController
  respond_to :json

  def index
    respond_with Tweet.order("created_at DESC").limit(10)
  end

  def show
    respond_with Tweet.where(:id => params[:id])
  end

end
