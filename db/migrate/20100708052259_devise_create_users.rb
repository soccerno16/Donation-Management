class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable
      
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false
      t.string :url_slug, :null => false
      t.string :gender, :null => false
      t.date :birthdate, :null => false
      t.integer :country_id, :null => false
      t.string :province

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end
