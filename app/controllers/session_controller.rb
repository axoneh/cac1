class SessionController < ApplicationController
  
 def create
   @goo=auth_hash
    lista=Autorizado.all #todos los autorizados
    userr=User.where(uid: auth_hash.uid).take #user es el campo del aut... si es nuevo es nil
    if lista.where(googleid: auth_hash.info.email).take == nil
          session[:user_id] = nil
          redirect_to action: "noautorizado" 
    else 
      if userr==nil
        redirect_to 'user/new'
       else
          @respuesta= "Viejo"
          user = User.from_omniauth(auth_hash)
        session[:user_id] = user.id
       end 
    end
    #redirect_to root_path
  end

  def destroy
    @@masa=nil
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
  
  def noautorizado
      @goo=@@masa
      @body_id = "noautorizado"
  end
  
  end

