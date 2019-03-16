class User < ApplicationRecord
  has_many :products
  has_one :credit_cards
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates :nickname, length: { maximum: 20 }
  validates :password, length: { minimum: 6 },allow_nil: true
  validates :nickname, presence: true
  validates :uid, :uniqueness => {:scope => :provider},allow_blank: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname:     auth.info.name,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
