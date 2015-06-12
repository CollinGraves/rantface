class User < ActiveRecord::Base

  has_many :rants, inverse_of: :user, dependent: :destroy

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash[:provider],
                 uid: auth_hash[:uid]).first_or_create
    user.update(
      nickname: auth_hash[:info][:nickname],
      profile_image: auth_hash[:info][:profile_image],
      token: auth_hash[:credentials][:token],
      secret: auth_hash[:credentials][:secret]
    )
    user
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_api_key || ENV['TWITTER_API_KEY']
      config.consumer_secret = Rails.application.secrets.twitter_api_secret || ENV['TWITTER_API_SECRET']
      config.access_token = token
      config.access_token_secret = secret
    end
  end
end
