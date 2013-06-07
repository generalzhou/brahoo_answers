class VotesController < ApplicationController

  def create
    vote = Vote.new(params[:vote])
    vote.user = current_user
    count = (vote.save ? params[:vote_count].to_i + 1 : params[:vote_count])

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => {count: count} }
    end
  end
end
