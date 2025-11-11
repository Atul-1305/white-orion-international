class CreateBrochures < ActiveRecord::Migration[7.1]
  def change
    create_table :brochures do |t|
      t.string :title
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
