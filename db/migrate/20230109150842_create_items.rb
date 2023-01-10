class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :item_name,        null: false, default: ""
      t.text       :item_explanation, null: false
      t.integer    :category_id,      null: false, default: ""
      t.integer    :price,            null: false, default: ""
      t.references :user,             null: false, foreign_key: true, default: ""
      t.integer    :item_status_id,   null: false, default: ""
      t.integer    :item_detail_id,   null: false, default: ""
      t.integer    :send_area_id,     null: false, default: ""
      t.integer    :send_charge_id,   null: false, default: ""


      t.timestamps
    end
  end
end
