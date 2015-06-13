Rails.application.config.middleware.use OmniAuth::Builder do
  unless Rails.env.development? || Rails.env.test?
    provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"]
  else
    provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
  end
end
