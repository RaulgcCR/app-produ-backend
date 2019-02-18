class AddSamplingtypeIdToActivity < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :sampling_type, foreign_key: true
  end
end
