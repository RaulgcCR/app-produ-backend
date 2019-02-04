class CreatePaths < ActiveRecord::Migration[5.1]
  def change
    create_table :paths do |t|
      t.integer :cantOperarios
      t.integer :temperatura
      t.integer :humedad
      t.date :fecha
      t.time :hora
      t.text :comentario

      t.timestamps
    end
  end
end
