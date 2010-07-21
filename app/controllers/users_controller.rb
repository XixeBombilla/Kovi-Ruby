class UsersController < ApplicationController
  before_filter :login_required
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Gracias por Entrar! Haz Entrado al Administrador."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
