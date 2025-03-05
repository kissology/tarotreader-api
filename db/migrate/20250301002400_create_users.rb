class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :phone_number
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
