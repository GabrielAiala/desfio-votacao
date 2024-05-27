class ParticipantsController < ApplicationController

  def create
    participant = Participant.new(participant_params)
    if participant.save
      render json: participant, status: :created
    else
      render json: { errors: participant.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:name)
  end
end