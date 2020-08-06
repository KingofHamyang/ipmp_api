class Ucc < ApplicationRecord
  validates_presence_of :link, :title

  belongs_to :team
  has_many :ucc_votes, :dependent => :destroy
end
