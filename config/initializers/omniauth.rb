OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '475445925693-3gra5o99po711qifhdbtvtnpp37u48iv.apps.googleusercontent.com', 'sW1ZBogP-KZ2l8h2SgBVHqNc',
    {
      :prompt => "select_account"
    }
end

=begin
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["475445925693-3gra5o99po711qifhdbtvtnpp37u48iv.apps.googleusercontent.com"], ENV["sW1ZBogP-KZ2l8h2SgBVHqNc"]
end
=end