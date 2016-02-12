class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.references :artist, index: true, foreign_key: true
      t.string :name
      t.timestamps null: false
    end
  end
end
