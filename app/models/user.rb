class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      #byebug
      user.uid = auth.uid
      user.nombre = auth.info.name
      puts auth.info.name
      puts user.nombre
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.fechanacimiento = auth.extra.raw_info.birthday
      user.genero = auth.extra.raw_info.gender
      user.foto = auth.extra.raw_info.picture
      puts user.foto
      user.email = auth.info.email
      puts user.email
      user.provider = auth.provider
      user.save!
    end
  end
end
