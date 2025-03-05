class CreateReadingCards < ActiveRecord::Migration[8.0]
  def change
    create_table :reading_cards do |t|
      t.references :reading, null: false, foreign_key: true
      t.references :tarot_card, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
