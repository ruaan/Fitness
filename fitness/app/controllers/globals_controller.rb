class GlobalsController < InheritedResources::Base
  before_action :set_global, only: [:show, :edit, :update, :destroy]

   # GET /globals
   # GET /globals.json
   def index
     @globals = Global.all

   end

   # GET /globals/1
   # GET /globals/1.json
   def show
     section = params[:section_id]
   end

   # GET /globals/new
   def new

     @global = Global.new
     modal_render("add")
   end

   # GET /globals/1/edit
   def edit

   end



   # POST /globals
   # POST /globals.json
   def create
      require 'byebug'
      session[:return_to] ||= request.referer

      @sectionx = global_params[:section_id]

      @sectionInfo = Section.where(id: @sectionx).all

      @subsectionInfo = Subsection.where(section_id: @sectionx).all
      @sectionInfo.each do |p|
      if @subsectionInfo.to_s == ''
         @global = Global.new
         @global.name = global_params[:name]
         @global.section = p.name
         @global.section_description = p.description
      # @global.subsection =  t.name

       @global.save
     else
       @subsectionInfo = Subsection.where(section_id: p.id).all
     #ssub = @findsection.subsections

     test_for_products = @subsectionInfo


     if test_for_products == '' || test_for_products.empty? || test_for_products.nil?
       @global = Global.new
       @global.name = global_params[:name]
       @global.section = p.name
       @global.section_description = p.description
       @global.subsection =  @subsectionInfo.name
       @global.subsection_description = @subsectionInfo.description

       @global.save
     else


       @subsectionInfo.each do |g|
       @lineitems = Lineitem.where(subsection_id:g.id).all
       @lineitems.each do |f|
       @global = Global.new
       @global.name = global_params[:name]
       @global.section = p.name

       @global.subsection = g.name
       @global.image = f.image
       @global.title = f.title
       @global.sku = f.sku
       @global.description = f.description
       @global.subdecription = f.subdescription
       @global.price = f.price
       @global.section_description = p.description
       @global.subsection_description = g.description
       @global.save
         end
     end
       end
     end
    end
    # z = f.first

     save_route_back(@global)
   end

   # PATCH/PUT /globals/1
   # PATCH/PUT /globals/1.json
   def update
      session[:return_to] ||= request.referer


      edit_route_back(@global, @global_params)

   end

   # DELETE /globals/1
   # DELETE /globals/1.json
   def destroy
     session[:return_to] ||= request.referer

     find_global_in_database
     destroy_loop
   redirect_back
   end

   private
      def find_global_in_database
        @findGlobal = Global.where(:id => params[:id]).first
        @getDestroy = Global.where(:name => @findGlobal.name).ids
      end
      def destroy_loop
        count = 0
        @getDestroy.each do |d|
          @lineitemdestroy = Global.where(id: @getDestroy[count]).first
          @lineitemdestroy.destroy
          count = count + 1
        end
      end
      def redirect_back
        respond_to do |format|
          format.html { redirect_to session.delete(:return_to), notice: 'Favourite was successfully deleted.'  }
          format.json { head :no_content }
        end
      end
     # Use callbacks to share common setup or constraints between actions.
     def set_global
       @global = Global.find(params[:id])
     end
    def global_params
      params.require(:global).permit(:section_id, :name, :section, :subsection, :image, :title, :sku, :quantity, :name, :description, :subdecription, :price)
    end
end

