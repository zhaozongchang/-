class Pin < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_attached_file :image, styles: { medium: "300x300" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  acts_as_votable
end
