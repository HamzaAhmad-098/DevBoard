class CreateTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :description
      t.integer :status, null: false
      t.references :creator, foreign_key: { to_table: :users }
      t.references :developer, foreign_key: { to_table: :users }
      t.references :qa, foreign_key: { to_table: :users }

      t.timestamps 
    end
  end
end
