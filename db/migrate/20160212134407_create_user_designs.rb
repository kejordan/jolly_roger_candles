class CreateUserDesigns < ActiveRecord::Migration
  def change
    create_table :user_designs do |t|
      t.integer :user_id
      t.integer :design_id
      t.timestamps null: false
    end
  end
end
