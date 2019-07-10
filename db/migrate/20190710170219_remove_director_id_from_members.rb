class RemoveDirectorIdFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :director_id, :integer
  end
end
