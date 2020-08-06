class User < ApplicationRecord
  validates_presence_of :account, :password

  belongs_to :student
  has_many :ucc_votes, :dependent => :destroy
end
