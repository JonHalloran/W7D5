class User < ApplicationRecord
  validates :presence, :username, :password_digest
  validates :uniqueness, :username, :session_token
  validates :password, length: { min: 6, allow_nil: true }
  after_initialization :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && Bcrypt::Password
      .new(password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
  end

  private

  def password=(password)
    self.password_digest = Bcrypt::Password.create(password)
    self.password = password
  end
end
