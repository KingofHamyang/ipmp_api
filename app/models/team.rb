class Team < ApplicationRecord
  validates_presence_of :name

  belongs_to :school
  has_many :students, :dependent => :destroy
end
