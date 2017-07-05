class Image < ApplicationRecord
  belongs_to :user

  validates :avatar, attachment_presence: true



end
