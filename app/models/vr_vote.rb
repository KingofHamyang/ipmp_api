class VrVote < ApplicationRecord
  belongs_to :user
  belongs_to :vr

  validates :user_id, uniqueness: { scope: :vr_id}
end
