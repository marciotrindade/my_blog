module Admin
  class PagesController < Admin::BaseController

    before_action :set_page, only: [:edit, :update, :destroy]

    # GET /pages
    def index
      @pages = Page.all
    end

    # GET /pages/new
    def new
      @page = Page.new
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to admin_pages_path, notice: 'Page was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to admin_pages_path, notice: 'Page was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to admin_pages_path
    end

    private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:name, :body, :keywords, :page_title, :page_body)
    end

  end
end
