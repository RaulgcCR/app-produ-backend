class CreateOperatorRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :operator_registers do |t|

      t.timestamps
    end
  end
end
