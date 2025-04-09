class TweetsController < ApplicationController
  def index
    tweets = Tweet
      .by_user(params[:user_id])

    render json: tweets.all
  end
end
