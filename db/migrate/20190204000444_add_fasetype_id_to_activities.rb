class AddFasetypeIdToActivities < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :fase_type, foreign_key: true
  end
end
