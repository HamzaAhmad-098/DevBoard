class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.references :user_id, null: false, foreign_key: { to_table: :users }
      t.references :ticket_id, null: false, foreign_key: { to_table: :tickets }
      t.timestamps null: false
    end
  end
end
