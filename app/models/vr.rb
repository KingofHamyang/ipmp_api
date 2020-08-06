class Vr < ApplicationRecord
  validates_presence_of :link

  belongs_to :team
  has_many :vr_votes, :dependent => :destroy
end
