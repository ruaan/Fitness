class VersionsController < InheritedResources::Base
  before_action :set_version, only: [:show, :edit, :update, :destroy]

  # GET /versions
  # GET /versions.json
  def index
    @versions = Version.all
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
    @project = Project.all
  end

  # GET /versions/new
  def new
    @version = Version.new
    @project = Project.all
    modal_render("form")

  end

  # GET /versions/1/edit
  def edit

  end

  # POST /versions
  # POST /versions.json
  def create
    @lineitems = Lineitem.all

    @projects = Project.all
    @project = Project.create(flag: 1)
    @projectid = Project.where(id: version_params[:project_id]).first
    @getfirst = Project.where(projectName: @projectid.projectName).first
    @getlast = Project.where(projectName: @projectid.projectName).last

    save_project


    getid = @project.id
    @testblank = version_params[:all]



    if @testblank == '0'
        @getsecdatas = Section.where(project_id:version_params[:project_id] )

        @getsecdatas.each do |l|
          @getsubdatas = Subsection.where(section_id: l.id)

          @section = Section.new
          @section.project_id = getid
          @section.name = l.name
          @section.save

          @getsubdatas.each do |s|

          @subsection = Subsection.new
          @subsection.section_id = @section.id
          @subsection.name = s.name
          @subsection.save

          @lineitem = s.lineitems


          @lineitem.each do |i|
            @thelineitem = @subsection.lineitems.create(image:i.image, title: i.title, sku:i.sku, catagory: i.catagory, price: i.price, description: i.description, quantity: i.quantity,  exvat_price: i.exvat_price)
           # create_lineitem
          end

        end
        end

      end
    #section.project_id = '18'
    redirect_to project_path(id = getid)
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    session[:return_to] ||= request.referer
    @version.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_version
    @version = Version.find(params[:id])
  end

  def save_project
    @project.projectName = @projectid.projectName
    @project.version = (@getlast.version.to_i) + 1
    @project.documentType = @getfirst.documentType
    @project.market = @getfirst.market
    @project.randDollar = @getfirst.randDollar
    @project.randPound = @getfirst.randPound
    @project.address = @getfirst.address
    @project.contactPerson = @getfirst.contactPerson
    @project.contactNumber = @getfirst.contactNumber
    @project.notes = @getfirst.notes
    @project.save
    @project.account_id = @projectid.account_id
    @project.user_id = current_user.id
    @project.save
  end


    def version_params
      params.require(:version).permit(:account_id, :project_id, :user_id, :version, :all)
    end
end

