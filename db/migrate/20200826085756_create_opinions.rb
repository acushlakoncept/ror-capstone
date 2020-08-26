class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.text :text
      t.integer :author_id

      t.timestamps
    end
    add_index :opinions, :author_id
    add_foreign_key :opinions, :users, column: :author_id
  end
end
