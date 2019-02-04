class AddFasetypeIdToFases < ActiveRecord::Migration[5.1]
  def change
    add_reference :fases, :fase_type, foreign_key: true
  end
end
