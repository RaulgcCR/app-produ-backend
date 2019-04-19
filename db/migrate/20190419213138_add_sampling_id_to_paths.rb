class AddSamplingIdToPaths < ActiveRecord::Migration[5.1]
  def change
  	add_reference :paths, :sampling, foreign_key: true
  end
end
