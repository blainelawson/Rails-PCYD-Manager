class AddRankingToMemberIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :member_issues, :ranking, :integer
  end
end
