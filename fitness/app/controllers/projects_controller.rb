class ProjectsController < ApplicationController
 # prawnto :prawn => { :top_margin => 75 }
  before_action :set_project, only: [:show, :edit, :update, :destroy, :noprice]



  # GET /projects
  # GET /projects.json
  def index
    index_decision
  end

  # GET /projects/1 # GET /projects/1.json 
  def show


    all_sources
    second_source
    if @lookup.ids.blank?
      section = Section.new(:project_id => @blue)
      section.save
      @sectionLookup = @lookup.ids[0]
      subsection = Subsection.new(:section_id => @sectionLookup)
      subsection.save
    elsif @lookup.present?

    else
      # section = Section.new(:project_id => @blue)
      section = Section.new(:project_id => @blue)
      section.save
      @sectionLookup = @lookup.ids[0]

      subsection = Subsection.new(:section_id => @sectionLookup)
      subsection.save


    end
    @products = Product.search(params[:search])
    pdf_create("Quote")


  end

  def noprice
    all_sources
    second_source
    pdf_create("noprice")

  end
  def techspec
    all_sources
    second_source
    pdf_create("tech")
  end
  def techspecnoprice
    all_sources
    second_source
    pdf_create("techspecnoprice")


  end
  def consolidated
    all_sources
    second_source

    pdf_create("consolidated")

  end
  def consolidatednoprice
    all_sources
    second_source
    pdf_create("consolidatednoprice")
  end
  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit

  def edit
  end

  # POST /projects
  # POST /projects.json

  def create
    create_resources
    save_route_back(@project)
  end

  def updatesap
    pro = Project.find(params[:id])
   @project = Project.where(id: pro).first
    @project.sapCode = params[:QuoteNumber]
    @project.save

  end
  def toexcel
    all_sources
    second_source
    @getProjectId = Project.find(params[:id])
    @projectids = Project.where(id: @getProjectId).first
    @excelaccount = Account.where(id:@projectids.account_id).first

    @users = User.where(:id => current_user.id).first
    @projects = Project.all
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    testing_mode
    @user = User.all
    change = set_project
    #getid = project
    change.flag = 1
    edit_route_back(@project, project_params)
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    delete_return(@project)
  end

  # PDF Generation starts here



  private

  def  pdf_create(doctype)
    users = User.where(:id => current_user.id).first
  @getbranch = Storeaddress.where(storecode: users.storeCode).first
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => doctype
      end
    end
  end

  def create_resources
    @section = Section.new
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new(project_params)
  end


  def testing_mode
    session[:line1] = "Add to Customer"
    session[:line2] = 'Add current Project to a Customer by clicking the flashing projects button on the left hand menu.'
    session[:line3] = 'Followed by the green button at the top. This will always assign the current project to a new customer.'
    session[:blink] = '.account'
  end

  def pdf_get(name, order)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = name.new(accounts,now)
        send_data pdf.render, filename: order,
                  type: "application/pdf",
                  disposition: "inline"

      end
    end
  end

  def second_source
    @accounts = Account.where(user_id: current_user.id).all

    @found = Project.find(params[:id])
    @blue = @found.id
    @pdfaccount = Account.where(id: @found.account_id).first
    puts @pdfaccount
    @lookup =  Section.where(project_id: @blue)
    @sections = Section.where(project_id: @blue)
    @pro = Project.all
    @projects = Project.find(params[:id])
    @products = Product.all
    @product = Product.new
    @soaps = Soap.all
    @soap = Soap.new
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:id, :account_id, :projectName, :sapCode, :version, :documentType, :market, :randDollar, :randPound, :address, :contactPerson, :contactNumber, :notes, :flag, :steps, :user_id, :exvat)
    end
end
