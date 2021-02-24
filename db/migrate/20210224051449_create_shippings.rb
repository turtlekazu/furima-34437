class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string      :postal_code,    null: false
      t.integer     :prefecture_id,  null: false
      t.string      :city,           null: false
      t.string      :address_line1,  null: false
      t.string      :address_line2
      t.string      :phone_number,   null: false
      t.references  :order,          foreign_key: true
      t.timestamps
    end
  end
end
