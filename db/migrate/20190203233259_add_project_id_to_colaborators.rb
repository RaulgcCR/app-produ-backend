class AddProjectIdToColaborators < ActiveRecord::Migration[5.1]
  def change
    add_reference :colaborators, :project, foreign_key: true
  end
end
