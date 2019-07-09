class CreateCommitteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :committee_members do |t|
      t.integer :committee_id
      t.integer :member_id
    end
  end
end
