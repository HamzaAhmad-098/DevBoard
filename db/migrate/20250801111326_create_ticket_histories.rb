class CreateTicketHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :ticket_histories do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :action, null: false
      t.string :old_value, null: false
      t.string :new_value, null: false

      t.timestamps
    end
  end
end
