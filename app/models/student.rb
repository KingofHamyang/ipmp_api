class Student < ApplicationRecord
  validates_presence_of :name, :phone

  belongs_to :team
  has_many :users, :dependent => :destroy
end
