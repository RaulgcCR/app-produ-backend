class AddFaseIdToPaths < ActiveRecord::Migration[5.1]
  def change
    add_reference :paths, :fase, foreign_key: true
  end
end
