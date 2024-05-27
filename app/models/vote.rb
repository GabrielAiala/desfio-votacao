class Vote < ApplicationRecord
  belongs_to :poll
  belongs_to :participant
end