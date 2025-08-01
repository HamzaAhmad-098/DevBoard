class CreateTicketHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :ticket_histories do |t|
      t.references :ticket_id, null: false, foreign_key: { to_table: :tickets }
      t.references :user_id, null: false, foreign_key: { to_table: :users }
      t.string :action, null: false
      t.string :old_value, null: false
      t.string :new_value, null: false

      t.timestamps
    end
  end
end
