class Notice < ApplicationRecord
  validates_presence_of :title, :description

  has_many :attachments, :dependent => :destroy
end
