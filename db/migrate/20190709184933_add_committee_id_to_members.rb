class AddCommitteeIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :committee_id, :integer
  end
end
