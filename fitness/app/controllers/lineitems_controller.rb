class LineitemsController < InheritedResources::Base

    before_action :set_lineitem, only: [:show, :edit,:manage, :update, :destroy, :clone]
    def clone
      @prescription = Prescription.find(params[:id])
      @new_prescription = @prescription.dup
      @new_prescription.save
    end
    # GET /lineitems
    # GET /lineitems.json
    def index


    end

    # GET /lineitems/1
    # GET /lineitems/1.json
    def show
      @found = Lineitem.find(params[:id])
      @found2 = Categorization.where(lineitem_id: 5)

      #@me = @found2.quantitys
    end

    # GET /lineitems/new
    def new

      @lineitem = Lineitem.new
      @lineitem.subsection_ids = params[:lineitem][:subsection_ids]
    end

    # GET /lineitems/1/edit
    def edit
      modal_render("edit")
    end

    def manage

    end

    # POST /lineitems
    # POST /lineitems.json
    def create

      @lineitem = Lineitem.new(lineitem_params)
      @lineitem.subsection_ids = params[:lineitem][:subsection_ids]
      save_route_back(@lineitem)
    end

    # PATCH/PUT /lineitems/1
    # PATCH/PUT /lineitems/1.json
    def update
      require 'byebug'
      @lineitemChange = Lineitem.where(id:params[:id]).first
      #byebug

      newsubsection = params[:subsection_id]
      if newsubsection.present?
      @lineitemChange.subsection_id = newsubsection
      end
      puts @price = params[:priceme]
      if @price.present?
     @lineitemChange.price = @price
     @exvat =  @price.to_f * 100 / 114
     @lineitemChange.exvat_price = @price.to_f - @exvat.to_f
      else
        if params[:price].present?
      @priceNoTile = params[:price]
      @lineitemChange.price = @priceNoTile

      @exvat = @priceNoTile.to_f * 100 / 114
      @lineitemChange.exvat_price = @priceNoTile.to_f - @exvat.to_f
          end
    end
      @lineitemChange.quantity = params[:quantity]

      @lineitemChange.save

      edit_route_back(@lineitem, lineitem_params )
    end

    # DELETE /lineitems/1
    # DELETE /lineitems/1.json
    def destroy
      session[:return_to] ||= request.referer
      @lineitem.destroy
      respond_to do |format|
        format.html { redirect_to session.delete(:return_to) }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineitem
      @lineitem = Lineitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lineitem_params
      params.require(:lineitem).permit(:image, :title, :sku, :catagory, :price,:quantity ,:description, :subdescription, :quantity,:vatex, :inclvat, :exvat_price, :subsection_id, :buom , :suom)
    end
  end
