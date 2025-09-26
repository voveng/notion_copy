# frozen_string_literal: true

class PagesController < ApplicationController
  layout 'pages'
  before_action :set_page, only: %i[show edit update destroy]

  # GET /pages or /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1 or /pages/1.json
  def show; end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit; end

  # POST /pages or /pages.json
  def create
    @page = Page.new workspace: Current.workspace, user: Current.user
    respond_to do |format|
      if @page.save
        format.html { redirect_to root_path, notice: 'Page was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.', status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy!

    respond_to do |format|
      format.html { redirect_to pages_path, notice: 'Page was successfully destroyed.', status: :see_other }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.expect(page: %i[title frontpage])
  end
end
