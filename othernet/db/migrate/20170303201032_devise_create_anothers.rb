class DeviseCreateAnothers < ActiveRecord::Migration
  def change
    create_table(:anothers) do |t|
      ## Database authenticatable
      t.string :another_name,              null: false, default: ""

      t.string :email
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip



      t.timestamps
    end

    add_index :anothers, :another_name,                unique: true
    add_index :anothers, :reset_password_token, unique: true

  end
end
