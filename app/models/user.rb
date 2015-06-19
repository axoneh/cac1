class User < ActiveRecord::Base
   
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.uid = auth.uid
        user.nombre = auth.info.name
        user.token = auth.credentials.token
        user.expires_at = Time.at(auth.credentials.expires_at)
        user.fechanacimiento = auth.extra.raw_info.birthday
        user.genero = auth.extra.raw_info.gender
        user.foto = auth.extra.raw_info.picture
        user.email = auth.info.email
        user.provider = auth.provider
        user.save!
      end #do
  end #def

end
