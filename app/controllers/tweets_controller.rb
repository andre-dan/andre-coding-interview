class TweetsController < ApplicationController
  def index
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 5

    tweets = Tweet
      .by_user(params[:user_id])
      .order(created_at: :asc)
      .limit(per_page)
      .offset((page - 1) * per_page)

    render json: tweets
  end
end