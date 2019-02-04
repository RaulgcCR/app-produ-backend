class AddSamplingIdToFases < ActiveRecord::Migration[5.1]
  def change
    add_reference :fases, :sampling, foreign_key: true
  end
end
