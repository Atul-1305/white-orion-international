class CreateDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :directors do |t|
      t.string :name           # director name
      t.string :position       # job title / role
      t.text :bio
      t.string :linkedin
      t.integer :sort_order, default: 0   # display order
      t.timestamps
    end
  end
end
