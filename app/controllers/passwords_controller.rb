class PasswordsController < ApplicationController
  layout "with_sidebar", :only => :index
  
  # GET /passwords
  # GET /passwords.json
  def index
    @passwords = Password.all_by_category(params[:category])
    
    @category = Category.find_by_id(params[:category])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @passwords }
    end
  end

  # GET /passwords/1
  # GET /passwords/1.json
  def show
    @password = Password.find(params[:id])
  
    respond_to do |format|
      format.html { render :layout => false }
      format.json { render json: @password }
    end
  end

  # GET /passwords/new
  # GET /passwords/new.json
  def new
    @password = Password.new
    
    @password.category_id = params[:category]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @password }
    end
  end

  # GET /passwords/1/edit
  def edit
    @password = Password.find(params[:id])
  end

  # POST /passwords
  # POST /passwords.json
  def create
    @password = Password.new(params[:password])

    respond_to do |format|
      if @password.save
        format.html { redirect_to passwords_path(:category => @password.category_id), notice: 'Password was successfully created.' }
        format.json { render json: @password, status: :created, location: @password }
      else
        format.html { render action: "new" }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /passwords/1
  # PUT /passwords/1.json
  def update
    @password = Password.find(params[:id])

    respond_to do |format|
      if @password.update_attributes(params[:password])
        format.html { redirect_to @password, notice: 'Password was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1
  # DELETE /passwords/1.json
  def destroy
    @password = Password.find(params[:id])
    @password.destroy

    respond_to do |format|
      format.html { redirect_to passwords_url }
      format.json { head :no_content }
    end
  end
end
