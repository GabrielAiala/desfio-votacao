class PollsController < ApplicationController

  def create
    poll = Poll.new(poll_parms)
    if poll.save
      render json: poll, status: :created
    else
      render json: { errors: participant.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    poll = Poll.last
    render json: { first_participant: poll.first_participant, second_participant: poll.second_participant }, status: :ok
  end

  def current_poll_stats
    current_poll = Poll.last
    total_votes = current_poll.votes.count
    votes_by_participant = current_poll.votes.group(:participant_id).count

    first_participant_votes = votes_by_participant[current_poll.first_participant_id] || 0
    second_participant_votes = votes_by_participant[current_poll.second_participant_id] || 0


    votes_by_hour = current_poll.votes.group("DATE_TRUNC('hour', created_at)").count


    participants = {
      first_participant: {
        participant: current_poll.first_participant,
        votes: first_participant_votes,
      },
      second_participant: {
        participant: current_poll.second_participant,
        votes: second_participant_votes,
      },
    }

    render json: { total_votes: total_votes, participants: participants, votes_by_hour: votes_by_hour }
  end

  private

  def poll_parms
    params.require(:poll).permit(:first_participant_id, :second_participant_id)
  end
end