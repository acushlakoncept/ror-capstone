class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :opinion

      t.timestamps
    end
  end
end