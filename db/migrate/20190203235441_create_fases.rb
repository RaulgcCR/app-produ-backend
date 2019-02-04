class CreateFases < ActiveRecord::Migration[5.1]
  def change
    create_table :fases do |t|
      t.float :p
      t.float :q
      t.float :error
      t.float :z

      t.timestamps
    end
  end
end
