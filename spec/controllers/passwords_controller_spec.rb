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

describe PasswordsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    @group = FactoryGirl.create(:group)
    @user.groups = [@group]
    sign_in @user
    
    @category = FactoryGirl.create :category
    @category.groups = [@group]
  end

  # This should return the minimal set of attributes required to create a valid
  # Password. As you add validations to Password, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => "My password",
      :description => "Some Description",
      :password => "SomeSecret",
      :category_id => @category.id
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PasswordsController. Be sure to keep this updated too.
  def valid_session
    nil
  end
  
  describe "GET search" do
    it "returns passwords by keyword in JSON" do
      category = FactoryGirl.create :category
      category.groups = [@group]
      password = FactoryGirl.create :password, :name => "password", :category => category
      get :search, :format => :json, :keywords => "password"
      response.body.should == [{:url => password_path(password), :name => password.name}].to_json
    end
  end

  describe "GET index" do
    it "renders with sidebar" do
      get :index, {}, valid_session
      response.should render_template "layouts/with_sidebar"
    end
    
    it "assigns all passwords as @passwords" do
      password = FactoryGirl.create :password, :category => nil
      get :index, {}, valid_session
      assigns(:passwords).should eq([password])
    end
    
    it "filters passwords by category" do
      Password.should_receive(:all_by_category).with('10')
      get :index, {:category => '10'}, valid_session
    end
    
    it "assigns category" do
      get :index, {:category => @category.id}, valid_session
      assigns(:category).should eq(@category)
    end
  end

  describe "GET show" do
    it "assigns the requested password as @password" do
      password = FactoryGirl.create :password, :category => @category
      get :show, {:id => password.to_param}, valid_session
      assigns(:password).should eq(password)
    end
  end

  describe "GET new" do
    it "assigns a new password as @password" do
      get :new, {:category => @category.id}, valid_session
      assigns(:password).should be_a_new(Password)
    end
    
    it "sets default category to a password" do
      get :new, {:category => @category.id}, valid_session
      assigns(:password).category_id.should == @category.id
    end
  end

  describe "GET edit" do
    it "assigns the requested password as @password" do
      password = FactoryGirl.create :password, :category => @category
      get :edit, {:id => password.to_param}, valid_session
      assigns(:password).should eq(password)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Password" do
        expect {
          post :create, {:password => valid_attributes}, valid_session
        }.to change(Password, :count).by(1)
      end

      it "assigns a newly created password as @password" do
        post :create, {:password => valid_attributes}, valid_session
        assigns(:password).should be_a(Password)
        assigns(:password).should be_persisted
      end

      it "redirects to the passwords lists correct category" do
        attrs = valid_attributes
        attrs[:category_id] = @category.id
        post :create, {:password => attrs}, valid_session
        response.should redirect_to(passwords_path(:category => @category.id))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved password as @password" do
        # Trigger the behavior that occurs when invalid params are submitted
        Password.any_instance.stub(:save).and_return(false)
        post :create, {:password => { :category_id => @category.id }}, valid_session
        assigns(:password).should be_a_new(Password)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Password.any_instance.stub(:save).and_return(false)
        post :create, {:password => { :category_id => @category.id }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested password" do
        password = FactoryGirl.create :password, :category => @category
        # Assuming there are no other passwords in the database, this
        # specifies that the Password created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Password.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => password.to_param, :password => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested password as @password" do
        password = FactoryGirl.create :password, :category => @category
        put :update, {:id => password.to_param, :password => valid_attributes}, valid_session
        assigns(:password).should eq(password)
      end

      it "redirects to the password lists correct category" do
        password = FactoryGirl.create :password, :category => @category
        put :update, {:id => password.to_param, :password => valid_attributes}, valid_session
        response.should redirect_to(passwords_path(:category => @category.id))
      end
    end

    describe "with invalid params" do
      it "assigns the password as @password" do
        password = FactoryGirl.create :password, :category => @category
        # Trigger the behavior that occurs when invalid params are submitted
        Password.any_instance.stub(:save).and_return(false)
        put :update, {:id => password.to_param, :password => {}}, valid_session
        assigns(:password).should eq(password)
      end

      it "re-renders the 'edit' template" do
        password = FactoryGirl.create :password, :category => @category
        # Trigger the behavior that occurs when invalid params are submitted
        Password.any_instance.stub(:save).and_return(false)
        put :update, {:id => password.to_param, :password => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested password" do
      password = FactoryGirl.create :password, :category => @category
      expect {
        delete :destroy, {:id => password.to_param}, valid_session
      }.to change(Password, :count).by(-1)
    end

    it "redirects to the passwords list" do
      password = FactoryGirl.create :password, :category => @category
      delete :destroy, {:id => password.to_param}, valid_session
      response.should redirect_to(passwords_url)
    end
  end

end
