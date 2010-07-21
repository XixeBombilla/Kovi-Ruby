class KoviController < ApplicationController
  
  def index
    @contacto = Contacto.new
  end
  
end
