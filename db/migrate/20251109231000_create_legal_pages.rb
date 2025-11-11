class CreateLegalPages < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_pages do |t|
      t.string :title
      t.text :content
      t.integer :page_type
      t.integer :status, default: 0
      t.datetime :published_at
      t.timestamps
    end
    add_index :legal_pages, :page_type, unique: true
  end
end
