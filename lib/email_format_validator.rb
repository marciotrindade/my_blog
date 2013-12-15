class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      object.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.messages.email_format', dfault: "is not formatted properly"))
    end
  end
end
