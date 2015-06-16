OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '475445925693-3gra5o99po711qifhdbtvtnpp37u48iv.apps.googleusercontent.com', '_OORnxZNZ-MqBgKReLOKzv8u',
    {
      :prompt => "select_account"
    }
end

=begin
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["475445925693-3gra5o99po711qifhdbtvtnpp37u48iv.apps.googleusercontent.com"], ENV["_OORnxZNZ-MqBgKReLOKzv8u"]
end
=end