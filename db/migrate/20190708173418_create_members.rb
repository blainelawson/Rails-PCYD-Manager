class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.date :dob
      t.boolean :admin, default: false
      t.integer :director_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :password_digest
      t.timestamps
    end
  end
end
