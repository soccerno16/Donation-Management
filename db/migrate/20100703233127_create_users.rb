class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :url_slug, :null => false
      t.string :gender, :null => false
      t.date :birthdate, :null => false
      t.integer :country_id, :null => false
      t.string :province
      t.boolean :active, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
