class AddProjectIdToSamplings < ActiveRecord::Migration[5.1]
  def change
    add_reference :samplings, :project, foreign_key: true
  end
end
