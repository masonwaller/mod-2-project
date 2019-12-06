class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :name, presence: true
  validates :user, presence: true
  validates :bio, presence: true
  validates :avatar, presence: true

  def image_resize
    self.avatar.variant(resize: "250x250")
  end
end
