class CreateSamplings < ActiveRecord::Migration[5.1]
  def change
    create_table :samplings do |t|
      t.string :nombre
      t.integer :cantMuestras
      t.integer :cantMuestrasTotal
      t.text :descripcion
      t.integer :fase

      t.timestamps
    end
  end
end
