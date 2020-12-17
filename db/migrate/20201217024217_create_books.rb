class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :author, null: false
      t.text :description, null: false
      t.date :date, null: false
      t.references :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
