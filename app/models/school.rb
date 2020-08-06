class School < ApplicationRecord
  validates_presence_of :name

  has_many :teams, :dependent => :destroy
end
