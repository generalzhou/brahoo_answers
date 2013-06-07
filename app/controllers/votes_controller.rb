class VotesController < ApplicationController

  def create
    vote = Vote.new(:voteable_id   => params[:voteable_id],
                    :voteable_type => params[:voteable_type],
                    :user_id       => current_user.id )
    count = (vote.save ? params[:vote_count].to_i + 1 : params[:vote_count])

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => {count: count} }   
    end
  end
end
