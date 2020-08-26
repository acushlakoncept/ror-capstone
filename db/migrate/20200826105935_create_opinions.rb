class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.text :text
      t.references :user, index: true

      t.timestamps
    end
  end
end
