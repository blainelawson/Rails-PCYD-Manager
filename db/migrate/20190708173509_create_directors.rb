class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :title
      t.string :phone
      t.string :email
      t.integer :chair_id
      t.timestamps
    end
  end
end
