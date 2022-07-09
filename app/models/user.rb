class User < ApplicationRecord
  before_save :downcase_email
  has_many :articles
  has_secure_password
  validates :username, presence: true,
                        length: { minimum: 3, maximum: 25 },
                        uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                      length: { maximum: 105 },
                      format: { with: URI::MailTo::EMAIL_REGEXP },
                      uniqueness: { case_sensitive: false }

  private
  def downcase_email
    self.email = email.downcase
  end

end
