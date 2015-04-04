require 'spec_helper'



describe SubsectionsController do

  let(:valid_attributes) { { "section_id" => "1" } }


  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all subsections as @subsections" do
      subsection = Subsection.create! valid_attributes
      get :index, {}, valid_session
      assigns(:subsections).should eq([subsection])
    end
  end

  describe "GET show" do
    it "assigns the requested subsection as @subsection" do
      subsection = Subsection.create! valid_attributes
      get :show, {:id => subsection.to_param}, valid_session
      assigns(:subsection).should eq(subsection)
    end
  end

  describe "GET new" do
    it "assigns a new subsection as @subsection" do
      get :new, {}, valid_session
      assigns(:subsection).should be_a_new(Subsection)
    end
  end

  describe "GET edit" do
    it "assigns the requested subsection as @subsection" do
      subsection = Subsection.create! valid_attributes
      get :edit, {:id => subsection.to_param}, valid_session
      assigns(:subsection).should eq(subsection)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Subsection" do
        expect {
          post :create, {:subsection => valid_attributes}, valid_session
        }.to change(Subsection, :count).by(1)
      end

      it "assigns a newly created subsection as @subsection" do
        post :create, {:subsection => valid_attributes}, valid_session
        assigns(:subsection).should be_a(Subsection)
        assigns(:subsection).should be_persisted
      end

      it "redirects to the created subsection" do
        post :create, {:subsection => valid_attributes}, valid_session
        response.should redirect_to(Subsection.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subsection as @subsection" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subsection.any_instance.stub(:save).and_return(false)
        post :create, {:subsection => { "section_id" => "invalid value" }}, valid_session
        assigns(:subsection).should be_a_new(Subsection)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subsection.any_instance.stub(:save).and_return(false)
        post :create, {:subsection => { "section_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested subsection" do
        subsection = Subsection.create! valid_attributes
        # Assuming there are no other subsections in the database, this
        # specifies that the Subsection created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Subsection.any_instance.should_receive(:update).with({ "section_id" => "1" })
        put :update, {:id => subsection.to_param, :subsection => { "section_id" => "1" }}, valid_session
      end

      it "assigns the requested subsection as @subsection" do
        subsection = Subsection.create! valid_attributes
        put :update, {:id => subsection.to_param, :subsection => valid_attributes}, valid_session
        assigns(:subsection).should eq(subsection)
      end

      it "redirects to the subsection" do
        subsection = Subsection.create! valid_attributes
        put :update, {:id => subsection.to_param, :subsection => valid_attributes}, valid_session
        response.should redirect_to(subsection)
      end
    end

    describe "with invalid params" do
      it "assigns the subsection as @subsection" do
        subsection = Subsection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subsection.any_instance.stub(:save).and_return(false)
        put :update, {:id => subsection.to_param, :subsection => { "section_id" => "invalid value" }}, valid_session
        assigns(:subsection).should eq(subsection)
      end

      it "re-renders the 'edit' template" do
        subsection = Subsection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subsection.any_instance.stub(:save).and_return(false)
        put :update, {:id => subsection.to_param, :subsection => { "section_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested subsection" do
      subsection = Subsection.create! valid_attributes
      expect {
        delete :destroy, {:id => subsection.to_param}, valid_session
      }.to change(Subsection, :count).by(-1)
    end

    it "redirects to the subsections list" do
      subsection = Subsection.create! valid_attributes
      delete :destroy, {:id => subsection.to_param}, valid_session
      response.should redirect_to(subsections_url)
    end
  end

end
