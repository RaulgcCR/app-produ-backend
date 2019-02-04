class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido1
      t.string :apellido2
      t.string :correo
      t.string :password
      t.string :token

      t.timestamps
    end
  end
end
