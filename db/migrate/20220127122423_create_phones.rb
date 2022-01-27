class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :segment_phone
      t.boolean :default_phone
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
