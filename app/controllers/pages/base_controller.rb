class Pages::BaseController < ApplicationController
  before_action :set_page

  private

  def set_page
    @page = Page.find_by(id: params[:page_id])
  end
end
