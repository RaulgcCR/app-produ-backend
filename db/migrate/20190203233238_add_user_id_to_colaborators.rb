class AddUserIdToColaborators < ActiveRecord::Migration[5.1]
  def change
    add_reference :colaborators, :user, foreign_key: true
  end
end
