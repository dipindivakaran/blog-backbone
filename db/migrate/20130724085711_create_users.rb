class CreateUsers < ActiveRecord::Migration
  def change
     create_table :users do |t|
      t.string :email
      t.string :title
      t.string :first_name
      t.string :last_name
      t.boolean :is_active, :default => false
      t.string :phone
      t.string    :crypted_password,    :null => true
      t.string    :password_salt,       :null => true
      t.string    :persistence_token,   :null => false
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.string    :openid_identifier
      t.timestamps
    end

    add_index :users, ["email"], :name => "index_users_on_email", :unique => true
    add_index :users, ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  end

  def self.down
    drop_table :users
  end
end
