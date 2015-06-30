class UsersController < ApplicationController
  def new
        @respuesta = "nuevo"
        user = User.from_omniauth(auth_hash)
        session[:user_id] = user.id
  end
end
