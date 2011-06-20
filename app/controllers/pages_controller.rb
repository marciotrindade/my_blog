class PagesController < ApplicationController

  def method_missing(symbol, &block)
    render params[:action].underscore.downcase
  end

end
