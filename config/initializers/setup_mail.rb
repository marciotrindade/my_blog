ActionMailer::Base.smtp_settings = AppConfig["smtp_settings"].symbolize_keys
