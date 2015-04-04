#require 'lib/crm'
require "crm"
include CrmIntegration

class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @getaccount = Account.where(:user_id => current_user.id)
    index_decision
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create

    session[:return_to] ||= request.referer


    @account = Account.new(account_params)
    @account.user_id = current_user.id
    @account.save
    @project = Project.find(params[:projectid])
    @project.flag = 1
    @project.version = 1
    @project.account_id = @account.id
    @project.save

    crm_integration
    save_route_back(@account)

  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    edit_route_back(@account, account_params)
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    delete_return(@account)
  end

  private
  def account_create_save
  @account = Account.new(account_params)
    @account.user_id = current_user.id
    @account.save
    @projectz = Project.where(id: projectid).first
    @projectz.flag = 1
    @projectz.version = 1
    @projectz.account_id = @account.id
    @projectz.save
  end


  def crm_integration
    contact_result = JSON.parse(CrmIntegration.createNewContact(account_params[:name],'',account_params[:email],account_params[:phone]))


    if  contact_result.blank? || contact_result["id"].empty?
      raise "An error occured whilst trying to update your contact details in CRM."
    end

    if can? :update, @account
      result = JSON.parse(CrmIntegration.createNewOpportunity(contact_result["id"], "Commercial"))
    else
      result = JSON.parse(CrmIntegration.createNewOpportunity(contact_result["id"], "Retail"))
    end

    if result.blank? || result["id"].empty?
      raise "An error occured whilst trying to create a new opportunity in CRM. "
    end
  end

  def index_decision
    if params[:search]
      @accounts = Account.search(params[:search]).order("created_at DESC").where(:user_id => current_user.id)
    else
      @accounts = Account.all.order('created_at DESC').where(:user_id => current_user.id)
    end
  end
  def training
    session[:line1] = "Print Quote"
    session[:line2] = 'Print quote by clicking the flashing Print button on the right hand menu.'
    session[:line3] = 'Email or Push to SAP by using icons on right menu.'
    session[:blink] = '.print'
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:user_id, :name, :phone, :email, :address, :vat,:projectid)
    end
end
