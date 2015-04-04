class SubsectionsController < ApplicationController
  before_action :set_subsection, only: [:show, :edit, :update, :destroy]

  # GET /subsections
  # GET /subsections.json
  def index
    @subsections = Subsection.all
  end

  # GET /subsections/1
  # GET /subsections/1.json
  def show
    @project = Project.all
  end

  # GET /subsections/new
  def new
    @subsection = Subsection.new
    @project = Project.all
  end

  # GET /subsections/1/edit
  def edit
    modal_render("projectedit")
  end

  def update
    session[:return_to] ||= request.referer
    @project = Project.all
    respond_to do |format|
      if @subsection.update(subsection_params)
        format.html { redirect_to session.delete(:return_to), notice: 'SubSection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /subsections
  # POST /subsections.json
  def create
    session[:return_to] ||= request.referer
    @subsection = Subsection.new(subsection_params)
    @project = Project.all

    respond_to do |format|
      if @subsection.save
        format.html { redirect_to session.delete(:return_to), notice: 'Subsection was successfully created.' }
        format.json { render action: 'show', status: :created, location: data_show_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @subsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsections/1
  # DELETE /subsections/1.json
  def destroy
    session[:return_to] ||= request.referer
    @subsection.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subsection
      @subsection = Subsection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subsection_params
      params.require(:subsection).permit(:section_id, :name, :description)
    end
end
