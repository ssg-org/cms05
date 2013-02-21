class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false
      t.string :encrypted_password, :null => false

      t.string  :firstname
      t.string  :lastname
      
      t.integer :role,              :null => false

      ## Trackable
      t.datetime :current_sign_in_at
      t.string   :current_sign_in_ip


      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end
end
