class CreateAboutSections < ActiveRecord::Migration[7.1]
  def change
    create_table :about_sections do |t|
      t.integer :section_type, default: 0
      t.string :title
      t.text :content
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
