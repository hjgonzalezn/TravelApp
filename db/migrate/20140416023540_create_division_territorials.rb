class CreateDivisionTerritorials < ActiveRecord::Migration
  def change
    create_table :division_territorials do |t|
      t.string :dvt_nombre
      t.string :dvt_estado_registro

      t.timestamps
    end
  end
end
