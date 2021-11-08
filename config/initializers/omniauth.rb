OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '360216399191498', '09b1ab61413013c01364dd44dd00dcde'
end