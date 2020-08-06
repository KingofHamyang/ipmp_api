class User < ApplicationRecord
  validates_presence_of :user_id, :password

  belongs_to :student
end
