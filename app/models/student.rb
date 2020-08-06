class Student < ApplicationRecord
  validates_presence_of :name, :phone
  validates_uniqueness_of :phone

  belongs_to :team
  has_many :users, :dependent => :destroy
end
