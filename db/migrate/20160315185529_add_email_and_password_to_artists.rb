class AddEmailAndPasswordToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :email, :string
    add_column :artists, :password, :string
  end
end
