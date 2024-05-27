class VotesController < ApplicationController
  def create
    current_poll = Poll.last
    vote = Vote.new(participant_id: vote_params[:participant_id], poll_id: current_poll.id)
    if vote.save
      render json: vote, status: :created
    else
      render json: { errors: vote.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:participant_id)
  end
end