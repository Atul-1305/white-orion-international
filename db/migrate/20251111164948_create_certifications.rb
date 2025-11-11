class CreateCertifications < ActiveRecord::Migration[7.1]
  def change
    create_table :certifications do |t|
      t.string :name
      t.boolean :active
      t.integer :sort_order

      t.timestamps
    end
  end
end
