class RemoveCommitteeIdFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :committee_id, :integer
  end
end
