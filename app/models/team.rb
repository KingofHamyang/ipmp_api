class Team < ApplicationRecord
  validates_presence_of :name

  belongs_to :school
  has_many :students, :dependent => :destroy
  has_many :uccs, :dependent => :destroy
  has_many :vrs, :dependent => :destroy
end
