class VotesController < ApplicationController

  def create
    vote = Vote.new(:voteable_id   => params[:voteable_id],
                    :voteable_type => params[:voteable_type],
                    :user_id       => current_user.id )
    flash[:error] = "You can't vote more than once!" unless vote.save
    redirect_to :back
  end
end
