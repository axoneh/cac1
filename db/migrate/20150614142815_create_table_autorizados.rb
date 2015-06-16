class CreateTableAutorizados < ActiveRecord::Migration
  def change
    create_table "autorizados" do |t|
      t.string :googleid
    end
  end
end
