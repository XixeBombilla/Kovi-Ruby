class ContactosController < ApplicationController
  
  before_filter :login_required, :except => [:new, :create] 
  
  def index
    @contactos = Contacto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contactos }
    end
  end

  # GET /contactos/1
  # GET /contactos/1.xml
  def show
    @contacto = Contacto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contacto }
    end
  end

  # GET /contactos/new
  # GET /contactos/new.xml
  def new
    @contacto = Contacto.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contacto }
    end
  end

  # GET /contactos/1/edit
  def edit
    @contacto = Contacto.find(params[:id])
  end

  # POST /contactos
  # POST /contactos.xml
  def create
    @contacto = Contacto.new(params[:contacto])
    UserMailer.deliver_registro(@contacto)
    
    respond_to do |format|
      if @contacto.save
        format.html { redirect_to(root_path, :notice => 'Gracias por tu mensaje, estaremos en contacto') }
        format.xml  { render :xml => @contacto, :status => :created, :location => @contacto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contacto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contactos/1
  # PUT /contactos/1.xml
  def update
    @contacto = Contacto.find(params[:id])

    respond_to do |format|
      if @contacto.update_attributes(params[:contacto])
        format.html { redirect_to(@contacto, :notice => 'Contacto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contacto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contactos/1
  # DELETE /contactos/1.xml
  def destroy
    @contacto = Contacto.find(params[:id])
    @contacto.destroy

    respond_to do |format|
      format.html { redirect_to(contactos_url) }
      format.xml  { head :ok }
    end
  end
end
