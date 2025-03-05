class CreateReflections < ActiveRecord::Migration[8.0]
  def change
    create_table :reflections do |t|
      t.references :reading, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
