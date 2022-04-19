class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  validates :title, presence: true, length: { minimum: 5 }
  validates :url, presence: true, format: { with: /www\..*\.com/ }
  validates :user, presence: true
  validates_uniqueness_of :title, case_sensitive: false
end
