# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  username        :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :username, :password, :password_confirmation
  has_secure_password
  has_many :bookmarks

  before_save { |user| user.email = email.downcase }
  before_save { |user| user.username = username.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { minimum: 2, maximum: 75 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :username, presence: true, length: { minimum: 4, maximum: 20 },
                       uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 7, maximum: 40 }
  validates :password_confirmation, presence: true

   private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
