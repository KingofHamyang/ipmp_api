class User < ApplicationRecord
  validates_presence_of :account, :password
  validates_uniqueness_of :account

  belongs_to :student
  has_many :ucc_votes, :dependent => :destroy
end
