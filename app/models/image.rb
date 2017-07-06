class Image < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url:"/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :avatar, attachment_presence: true

  scope(:not_private, -> do
    where({:private => nil})
  end)

end
