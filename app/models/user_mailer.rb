class UserMailer < ActionMailer::Base
  def registro(contacto)
    from contacto.correo
    recipients 'ventas@inmobiliariakovi.com'
    subject "Desde la Pagina de Kovi"
    body :contacto => contacto 
    @sent_on      = Time.now
    @content_type = "text/html"
    @body[:contacto]  = contacto
  end  

end
