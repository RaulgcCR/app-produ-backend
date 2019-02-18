class CreateSamplingTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :sampling_types do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
