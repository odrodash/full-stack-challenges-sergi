class User < ActiveRecord::Base
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /.*@.*\.com/ }
  before_validation :remove_whitespaces
  after_create :send_welcome_email

  private

  def remove_whitespaces
    self.email = email.strip unless email.nil?
  end

  def send_welcome_email
    FakeMailer.instance.mail(email, "welcome!")
  end
end
