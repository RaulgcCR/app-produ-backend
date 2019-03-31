class AddMuestrasActualToSamplings < ActiveRecord::Migration[5.1]
  def change
    add_column :samplings, :muestrasActual, :Integer
  end
end
