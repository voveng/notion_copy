class Pages::SectionsController < Pages::BaseController
  before_action :set_section, only: %i[show edit update destroy]

  # GET /sections or /sections.json
  def index
    @sections = @page.sections
  end

  # GET /sections/1 or /sections/1.json
  def show; end

  # GET /sections/new
  def new
    @section = @page.sections.build
  end

  def sort
    # Parse the request body as JSON if it's not already parsed as params
    ids = if params['_json']
            params['_json']
          elsif request.content_type.in?(%w[application/json text/json])
            JSON.parse(request.raw_post)
          else
            []
          end

    # Convert all ids to integers and filter out invalid ones
    valid_ids = ids.map(&:to_i).select { |id| id > 0 }

    # Update positions only for the sections that belong to this page
    valid_ids.each_with_index do |id, index|
      section = @page.sections.find_by(id: id)
      section&.update_column(:position, index + 1)  # Using update_column to avoid callbacks
    end
    
    head :ok
  rescue JSON::ParserError
    head :bad_request
  end

  # GET /sections/1/edit
  def edit; end

  # POST /sections or /sections.json
  def create
    @section = @page.sections.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @page, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @page, notice: 'Section was successfully updated.', status: :see_other }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section.destroy!

    respond_to do |format|
      format.html { redirect_to @page, notice: 'Section was successfully destroyed.', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_section
    @section = @page.sections.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def section_params
    params.require(:section).permit(:kind, :title, :body)
  end
end
