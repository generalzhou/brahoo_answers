class VotesController < ApplicationController

  def new
  end

  def create
    p params
    vote = Vote.new(:voteable_id => params[:voteable_id],
                    :voteable_type => params[:voteable_type])
    vote.user_id = current_user.id
    if vote.save
      puts "\n\n\n\nSuccess!!\n\n\n\n"
    end
    redirect_to :back
  end
end
