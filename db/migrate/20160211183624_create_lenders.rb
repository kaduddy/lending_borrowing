class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :password_digest
      t.integer :money

      t.timestamps null: false
    end
  end
end
