class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.text :address
      t.text :suburb
      t.text :state
      t.integer :postcode
      t.text :description

      t.timestamps
    end
  end
end
