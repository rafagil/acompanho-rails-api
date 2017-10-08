class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :url
      t.boolean :failedUpdate
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
