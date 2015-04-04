class CopysecsController < InheritedResources::Base
  before_action :set_copysec, only: [:show, :edit, :update, :destroy]

   # GET /copysecs
   # GET /copysecs.json
   def index
     @copysecs = Copysec.all
   end

   # GET /copysecs/1
   # GET /copysecs/1.json
   def show
     @project = Project.all
   end

   # GET /copysecs/new
   def new
     @copysec = Copysec.new
     @projects = Project.all
      @project = Project.new
     modal_render("form")
   end

   # GET /copysecs/1/edit
   def edit
      @projects = Project.all
           @project = Project.new

   end

   # POST /copysecs
   # POST /copysecs.json
   def create
     #require "byebug"
     @copysec = Copysec.new(copysec_params)
     @project = Project.all
     copy_section_create
     section_item_loop
      save_route_back(@copysec)
   end

   # DELETE /copysecs/1
   # DELETE /copysecs/1.json
   def destroy
    copysec_destroy
   end
  private
  def section_item_loop
    ssub = @findsection.subsections
    # zf = @subsectionc.lineitems
    ssub.each do |f|
      @subsection = @section.subsections.create(section_id: f.section_id, name: f.name)
      @lineitem = Lineitem.where(subsection_id:f.id).all
      @lineitem.each do |g|
        @subsection.lineitems.create(image:g.image, title: g.title, sku: g.sku, catagory: g.catagory, price: g.price, description: g.description, quantity: g.quantity, exvat_price: g.exvat_price)
        #create_lineitem
      end
    end
  end
  def copy_section_create
    @sectionx = copysec_params[:section_id]
    @newname = copysec_params[:name]
    @newDescription = copysec_params[:description]
    @findsection = Section.where(id:@sectionx).first
    @section = Section.new
    @section.project_id = @findsection.project_id
    @section.name = @newname
    @section.description = @newDescription
    @section.save
  end
  def copysec_destroy
    session[:return_to] ||= request.referer
    @copysec.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.json { head :no_content }
    end
  end

    def copysec_params
      params.require(:copysec).permit(:project_id, :section_id, :name, :description)
    end
end
