class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, index: true
      t.string :fullname
      t.string :photo, default: "https://source.unsplash.com/random/60x60"
      t.string :cover_image, default: "https://source.unsplash.com/random/600x250"

      t.timestamps
    end
  end
end
