# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

autorizados = Autorizado.delete_all
autorizados = Autorizado.create([{"id"  => 1, "googleid" => "carlitosau@gmail.com"},{"id" => 2, "googleid" => "carlos@axoneh.com"}])

antics = Antic.delete_all
antics = Antic.create([{"id"=>1, "nombre" =>"Warfarina", "presentacion"=>"Tableta x 5 mg", "requiere_inr"=>0}])
antics = Antic.create([{"id"=>2, "nombre" =>"Dabigatran", "presentacion"=>"Capsula x 75 mg ", "requiere_inr"=>1}])