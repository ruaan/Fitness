class SectionsController < ApplicationController
  respond_to :html, :js
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @project = Project.all
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    modal_render("form")
    @project = Project.all
    @section = Section.new

  end

  # GET /sections/1/edit
  def edit
    modal_render("edit")
  end

  # POST /sections
  # POST /sections.json
  def create
    require 'byebug'

    @subsection_name = params[:subsection_name]
    @subsection_description = params[:subsection_description]
    @auto = params[:auto]
    @project = Project.all
    #@projects = Project.find(params[:id])
    #byebug
    if @auto != "1"
    @section = Section.create(section_params)
    #@section.save
    @subsection = Subsection.new
    @subsection.section_id = @section.id
    if @subsection_name.present?
    @subsection.name = @subsection_name
    @subsection.description = @subsection_description
    else
      @subsection.name = @section.name
      @subsection.description = @section.description
      end
    @subsection.save
    else
      @section = Section.create(section_params)
      end
    #save_route_back(@section)
    render :js => " $('#new_modal').modal('hide')"
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update


    @project = Project.all
    edit_route_back(@section, section_params)
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    session[:return_to] ||= request.referer
    @section.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:project_id, :name, :description, :misc, :subsection_name, :subsection_description, :auto)
    end
end
