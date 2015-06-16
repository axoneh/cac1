class AddOtrascosasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :genero, :string
    add_column :users, :foto, :string
  end
end
