class CreateTarotCards < ActiveRecord::Migration[8.0]
  def change
    create_table :tarot_cards do |t|
      t.string :name
      t.string :img_link
      t.string :arcana_type
      t.string :element
      t.text :description

      t.timestamps
    end
  end
end
