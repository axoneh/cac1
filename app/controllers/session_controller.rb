class SessionController < ApplicationController
  def new
  end

 def create
    @goo=env["omniauth.auth"]
    lista=Autorizado.all #todos los autorizados
    userr=User.where(uid: @goo.uid).take #user es el campo del aut... si es nuevo es nil
    if lista.where(googleid: @goo.info.email).take == nil
      @respuesta = "No Autorizado"
    else 
      if userr==nil
        @respuesta = "nuevo"
        user = User.from_omniauth(@goo)
        session[:user_id] = user.id
        redirect_to action: "nuevo" 
       else
          @respuesta= "Viejo"
          user = User.from_omniauth(@goo)
        session[:user_id] = user.id
       end 
    end
    #redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
  
  def nuevo
      goo=env["omniauth.auth"]
      
  end

  
  end

