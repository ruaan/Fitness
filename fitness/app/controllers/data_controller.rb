require "multi_json"
class DataController < ApplicationController
  before_filter :authenticate_user!


def delete
  #User.destroy_all
  #Account.destroy_all
  #Project.destroy_all
 # Offtimesdestroy_all
  #    User.where(:role_id => 3).destroy_all
end

def list
  get_all
  end

  def misc
  end

  def show
    get_all
    @accounts = Account.where(:user_id => current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = QuotePdf.new()
        send_data pdf.render, filename: "order_#322323.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end

  end
  def saveOpenQuote
    projectid = params[:project_id]
    @project = Project.where(:id => projectid).first
    @project.flag = 1
    @project.save
    redirect_to data_one_path
  end

  def one
    get_some
    #get_training
    if @projects.ids.blank?
      blank_project
    elsif @projects.where(:flag => 0).where(:user_id => current_user.id).present?
       else_blank
    else
     create_project
     create_project_work
      redirect_to project_path(id = @getid)
     get_user
    end
     end



  def showfav
    @globals = Global.all
  end
  def addfav
    addfav_data

    @getdatas.each do |i|
      @i = i
    fav_section_create
    #@testsection = ""

    fav_subsection_create
    #@testsubsection = ""
    #@lineitem = @subsection.lineitems.create(title: l.title)
    exvatprice =  i.price * 0.14
      exvatfinal = i.price - exvatprice


      @productData = Product.where(sku:i.sku).first


    #@lineitem = @subsection.lineitems.create(image:l.image, title: l.title, sku:l.sku, catagory: l.catagory, price: l.price, description: l.description, quantity: l.quantity,  inclvat: l.price)
    #@lineitem = @subsection.lineitems.create(image:i.image, title: i.title, sku:i.sku, catagory: i.catagory, price: i.price, description: i.description, quantity: i.quantity,  exvat_price: i.exvat_price)
    @thelineitem = @subsection.lineitems.create(image:i.image, title: i.title, sku:i.sku, catagory: i.catagory, price: i.price, description: i.description, quantity: 1,  exvat_price: exvatfinal,umren:@productData.umren,umrez:@productData.umrez ,suom: @productData.suom, buom: @productData.buom)

    end

redirect_to project_path(id = @projectid)
end
private
  def fav_subsection_create
    if @i.subsection == @testsubsection
    else
      @testsubsection = @i.subsection
      @subsection = Subsection.new
      @subsection.section_id = @section.id
      @subsection.name = @i.subsection
      @subsection.description = @i.subsection_description
      @subsection.save
      end
  end
  def fav_section_create
    if @i.section == @testsection
    else
    @testsection = @i.section
    @section = Section.new
    @section.project_id = @projectid
    @section.name = @i.section
    @section.description = @i.section_description
    @section.save
    end
  end
  def get_all
    @section = Section.new
    @sections = Section.all
    @subsections = Subsection.all
    @subsection = Subsection.new
    @project = Project.new
    @projects = Project.all
    @products = Product.all
    @product = Product.new
  end
  def get_user
    @product = Product.new
    @accounts = Account.where(:user_id => current_user.id)
  end
  def get_some
    @projects = Project.all
    @subsections = Subsection.all
    @sections = Section.all

  end

  def blank_project_first
    project = Project.create(flag: 0)
    @number = 299999999 + rand(100) + rand(100)
    project.projectName = @number
    project.save
  end
  def blank_project_work
    project = Project.create(projectName: number)
    project.save
    project.account_id = @account.id
    project.user_id = current_user.id
    project.save
  end
  def blank_project
    blank_project_first
    blank_project_work
    @getid = project.id

    redirect_to project_path(id = @getid)
  end
  def else_blank
    @projectzs = Project.where(:flag => 0).where(:user_id => current_user.id).ids
    @getid = @projectzs
    redirect_to project_path(id = @getid)
  end
  def create_project
    @project = Project.create(flag: 0)
    @number = 299999999 + rand(1000) + rand(1000) + rand(1000)
    @project.version = 1
    @project.projectName = @number
    @project.save
  end
  def create_project_work
    @project.user_id = current_user.id
    @project.save
    @projects.where(:flag => 0).where(:user_id => current_user.id).ids
    @getid = @project
  end
  def addfav_data
    @projects = Project.all
    @project = Project.new
    @favname = params[:favname]
    @projectid = params[:projectid]
    @getdatas = Global.where(name: @favname).all
  end
end
