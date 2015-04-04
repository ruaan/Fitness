require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe InstallsController do

  # This should return the minimal set of attributes required to create a valid
  # Install. As you add validations to Install, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "image" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InstallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all installs as @installs" do
      install = Install.create! valid_attributes
      get :index, {}, valid_session
      assigns(:installs).should eq([install])
    end
  end

  describe "GET show" do
    it "assigns the requested install as @install" do
      install = Install.create! valid_attributes
      get :show, {:id => install.to_param}, valid_session
      assigns(:install).should eq(install)
    end
  end

  describe "GET new" do
    it "assigns a new install as @install" do
      get :new, {}, valid_session
      assigns(:install).should be_a_new(Install)
    end
  end

  describe "GET edit" do
    it "assigns the requested install as @install" do
      install = Install.create! valid_attributes
      get :edit, {:id => install.to_param}, valid_session
      assigns(:install).should eq(install)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Install" do
        expect {
          post :create, {:install => valid_attributes}, valid_session
        }.to change(Install, :count).by(1)
      end

      it "assigns a newly created install as @install" do
        post :create, {:install => valid_attributes}, valid_session
        assigns(:install).should be_a(Install)
        assigns(:install).should be_persisted
      end

      it "redirects to the created install" do
        post :create, {:install => valid_attributes}, valid_session
        response.should redirect_to(Install.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved install as @install" do
        # Trigger the behavior that occurs when invalid params are submitted
        Install.any_instance.stub(:save).and_return(false)
        post :create, {:install => { "image" => "invalid value" }}, valid_session
        assigns(:install).should be_a_new(Install)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Install.any_instance.stub(:save).and_return(false)
        post :create, {:install => { "image" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested install" do
        install = Install.create! valid_attributes
        # Assuming there are no other installs in the database, this
        # specifies that the Install created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Install.any_instance.should_receive(:update).with({ "image" => "MyString" })
        put :update, {:id => install.to_param, :install => { "image" => "MyString" }}, valid_session
      end

      it "assigns the requested install as @install" do
        install = Install.create! valid_attributes
        put :update, {:id => install.to_param, :install => valid_attributes}, valid_session
        assigns(:install).should eq(install)
      end

      it "redirects to the install" do
        install = Install.create! valid_attributes
        put :update, {:id => install.to_param, :install => valid_attributes}, valid_session
        response.should redirect_to(install)
      end
    end

    describe "with invalid params" do
      it "assigns the install as @install" do
        install = Install.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Install.any_instance.stub(:save).and_return(false)
        put :update, {:id => install.to_param, :install => { "image" => "invalid value" }}, valid_session
        assigns(:install).should eq(install)
      end

      it "re-renders the 'edit' template" do
        install = Install.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Install.any_instance.stub(:save).and_return(false)
        put :update, {:id => install.to_param, :install => { "image" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested install" do
      install = Install.create! valid_attributes
      expect {
        delete :destroy, {:id => install.to_param}, valid_session
      }.to change(Install, :count).by(-1)
    end

    it "redirects to the installs list" do
      install = Install.create! valid_attributes
      delete :destroy, {:id => install.to_param}, valid_session
      response.should redirect_to(installs_url)
    end
  end

end
