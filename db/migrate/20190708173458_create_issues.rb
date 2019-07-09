class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :key_word
      t.text :summary
      t.timestamps
    end
  end
end
