class User < ActiveRecord::Base
  has_many :teams

  validates :provider, presence: true
  validates :uid, presence: true
  validates :email, presence: true
  validates :username, presence: true
  validates :avatar_url, presence: true

  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.avatar_url = auth.info.image
    end
  end
end
