class Participant < ApplicationRecord
  has_many :poll_as_first_participant, class_name: 'Poll', foreign_key: 'first_participant_id'
  has_many :poll_as_second_participant, class_name: 'Poll', foreign_key: 'second_participant_id'
  has_many :votes
end