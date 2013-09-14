class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  # :confirmable, 
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, 
        :trackable, :validatable, :omniauthable, 
        :omniauth_providers => [:facebook]

  attr_accessor :name

  # Set up Validations
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }  

  # Allows for a quick pull of the User's name without having to save said name
  after_initialize :get_name 
  def get_name
  self.name = (first_name || "") + " " + (last_name || "")
  end

  def password_validation_required?
    :encrypted_password.nil? || !@password.blank? || !@password_confirmation.blank?
  end
    
  # Password validations update  
  validates :password, presence: true, length: { minimum: 8 },
    :if => :password_validation_required?
  validates :password_confirmation, presence: true,
    :if => :password_validation_required?

  before_save { email.downcase! }
  before_save :create_remember_token

  def self.find_for_oauth(provider, uid, first_name, last_name, email, signed_in_resource=nil)
    
    # Dummy data for passwords
    password_placeholder = Devise.friendly_token[0,20]
    
    # Check to see if user has previously logged in
    if provider == "facebook"
      # Test to see if this authentication path has ever been used before
      
      user = User.where(:facebookuid => uid).first
      unless user
        if user
          user.facebookuid = auth.uid
        else
          user = User.create(:first_name => first_name,
                     :last_name => first_name,
                     :facebookuid => uid,
                     :email => email,
                     :password => password_placeholder,
                     :password_confirmation => password_placeholder,
                     :nativelogin => false,
                     )
        end
      end
    end
    user
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end