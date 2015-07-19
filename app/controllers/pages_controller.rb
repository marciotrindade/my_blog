class PagesController < ApplicationController
  def show
    @page = Page.find_by_permalink(params[:id])
    fresh_when(etag: @page, last_modified: @page.updated_at, public: true)
  end
end
