Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["475445925693-j45275365lvj9uc29l5q3pvaiqd158r0.apps.googleusercontent.com"], ENV["GAIc59H6hw4AOBB993GGe1sQ"]
end