class KoviController < ApplicationController
  
  def index
    @contacto = Contacto.new
    @asesores = Asesor.all
    @noticias = Noticia.all
  end
  
  def inicio
  end
  
end
