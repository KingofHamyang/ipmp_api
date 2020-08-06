class UccVote < ApplicationRecord
  belongs_to :user
  belongs_to :ucc

  validates :user_id, uniqueness: { scope: :ucc_id}
end
