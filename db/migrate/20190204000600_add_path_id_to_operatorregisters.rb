class AddPathIdToOperatorregisters < ActiveRecord::Migration[5.1]
  def change
    add_reference :operator_registers, :path, foreign_key: true
  end
end
