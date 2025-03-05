class CreateReadings < ActiveRecord::Migration[8.0]
  def change
    create_table :readings do |t|
      t.integer :client_id
      t.references :reading_type, null: false, foreign_key: true
      t.datetime :reading_date

      t.timestamps
    end
  end
end
