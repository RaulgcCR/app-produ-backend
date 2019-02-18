class AddSamplingtypeIdToSampling < ActiveRecord::Migration[5.1]
  def change
    add_reference :samplings, :sampling_type, foreign_key: true
  end
end
