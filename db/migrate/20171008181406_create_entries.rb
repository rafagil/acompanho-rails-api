class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :description
      t.string :link
      t.boolean :unread
      t.date :pubDate
      t.string :image
      t.string :imageBase64
      t.string :summary
      t.references :feed, foreign_key: true

      t.timestamps
    end
  end
end
