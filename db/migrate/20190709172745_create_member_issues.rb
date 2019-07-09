class CreateMemberIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :member_issues do |t|
      t.integer :member_id
      t.integer :issue_id

      t.timestamps
    end
  end
end
