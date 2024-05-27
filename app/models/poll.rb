class Poll < ApplicationRecord
  belongs_to :first_participant, class_name: 'Participant', foreign_key: 'first_participant_id'
  belongs_to :second_participant, class_name: 'Participant', foreign_key: 'second_participant_id'
  has_many :votes
end