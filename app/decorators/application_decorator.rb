class ApplicationDecorator < Draper::Base

  def t(name, opts={})
    I18n.t(name, opts)
  end

  def l(date, options={})
    I18n.l(date, options)
  end

end