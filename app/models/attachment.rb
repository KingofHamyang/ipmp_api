class Attachment < ApplicationRecord
  validates_presence_of :file_name

  belongs_to :notice
end
