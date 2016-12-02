class User < ApplicationRecord
  rolify
  attr_accessor :category
  after_create :assign_role

  # Associations
  has_many :authorizations, dependent: :destroy

  devise :database_authenticatable, :registerable,  :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  devise :database_authenticatable, :validatable, password_length: 8..128

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid.to_s, secret: auth.credentials.secret).first_or_initialize
    authorization.token = auth.credentials.token
    if authorization.user.blank?
      user = current_user || User.where('email = ?', auth['info']['email']).first
      if user.blank?
        user = User.new( name: auth.info.name,
                         password: Devise.friendly_token[0,10],
                         email: auth.info.email
                        )
        user.save!
      end
      authorization.username = auth.info.email
      authorization.name = auth.info.name
      authorization.user_id = user.id
    end
    authorization.save
    authorization.user
  end

  protected
    def assign_role
      role = self.category =~ /business|organization/ ? self.category : 'individual'
      self.add_role(role)
    end
end
