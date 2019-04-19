class AddExtraFlagToFases < ActiveRecord::Migration[5.1]
  def change
  	add_column :fases, :extraFlag, :Integer
  end
end
