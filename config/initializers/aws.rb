require 'aws-sdk-s3'

if Rails.env.production?
  Aws.config.update(
    logger: ::Rails.logger,
    credentials: Aws::Credentials.new(Rails.application.credentials.dig(:aws, :access_key_id), Rails.application.credentials.dig(:aws, :secret_access_key))
  )
end