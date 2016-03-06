require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  #Defining Validations
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  
  # Defining Associations
  has_one :preference

  delegate :color, :title, :font, to: :preference, allow_nil: true
  before_create :generate_token


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def as_json(options={})
    super(
      :only => [:name, :email, :token, :color],
      :methods => [:color, :title, :font])
  end

  private
    def generate_token
      self.token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless User.exists?(token: random_token)
      end
    end
end
