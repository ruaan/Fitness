class ApplicationController < ActionController::Base
  #before_filter :set_headers
  before_filter :authenticate_user!
  #skip_before_action :verify_authenticity_token
  #protect_from_forgery with: :exception
  #after_filter :cors_set_access_control_headers


  include ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  #protect_from_forgery with: :null_session
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  def soap_login
    @wsdl = "http://www.italtile.co.za/api/soap/?wsdl"
    @username = "sync"
    @password = "sync_123"
  end
private

  def configure_permitted_parameters
    ## To permit attributes while registration i.e. sign up (app/views/devise/registrations/new.html.erb)
    devise_parameter_sanitizer.for(:sign_up) << :role << :training_mode

    ## To permit attributes while editing a registration (app/views/devise/registrations/edit.html.erb)
    devise_parameter_sanitizer.for(:account_update) << :role << :training_mode
  end

  def save_route_back(input)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if input.save
        message =  'was successfully created.'
        format.html { redirect_to session.delete(:return_to), notice: message }
        format.json { render action: 'show', status: :created, location: input }
        format.js { render js: " $('#testnow').modal('hide')"}
      else

        format.html { render action: 'new' }
        format.json { render json: input.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_route_back(input, input_params)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if input.update(input_params)
        createdmessage = ' was successfully updated.'
        format.html { redirect_to session.delete(:return_to), notice: createdmessage }
        format.json { head :no_content }

      else
        format.html { render action: 'edit' }
        format.json { render json: input.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_render(template)
    respond_to do |format|
      format.js { render :partial => template }
    end
  end

  def delete_return(input)
    session[:return_to] ||= request.referer
    input.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.json { head :no_content }
    end
  end
  def check_search
    @accounts = Account.search(params[:search]).order("created_at DESC").where(:user_id => current_user.id)

  end
  def check_create
    @accounts = Account.all.order('created_at DESC').where(:user_id => current_user.id)
  end
  def create_lineitem
    @thelineitem = @subsection.lineitems.create(image:i.image, title: i.title, sku:i.sku, catagory: i.catagory, price: i.price, description: i.description, quantity: i.quantity,  exvat_price: i.exvat_price)
  end
  def index_decision
    if params[:search]
      check_search
    else
      check_create
    end
  end
  def first_source
    @users = User.where(id:current_user.id)
    @section = Section.new
    @global = Global.new
    @globals = Global.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @copysubs = Copysub.all
    @getUser =  User.where(id:current_user.id).first


  end
  def all_sources
    first_source
    third_source
    @copysub = Copysub.new
    @copysecs = Copysub.all
    @copysec = Copysub.new
    @account = Account.new
    @product = Product.new
    @products = Product.all
    pro = Project.find(params[:id])
    now = Project.where(id: pro)
    @project = Project.where(id: pro).first

    @sappushes = Sappush.all
    @sappush = Sappush.new


  end

end
def third_source
  @account = Account.new
  @accounts = Account.where(:user_id => current_user.id)
  @project = Project.new
  @projects = Project.all
  @lineitem = Lineitem.new
  @saps = Sap.all
  @sap = Sap.new

  @magento = Magento.new
  @magentos = Magento.all
end