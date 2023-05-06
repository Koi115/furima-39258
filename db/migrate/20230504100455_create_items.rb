class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,          null: false, foreign_key: true
      t.string     :name,          null: false, default: ""
      t.text       :description,   null: false
      t.integer    :category_id,   null: false, default: 1
      t.integer    :status_id,     null: false, default: 1
      t.integer    :fee_id,        null: false, default: 1
      t.integer    :prefecture_id, null: false, default: 1
      t.integer    :period_id,     null: false, default: 1
      t.integer    :price,         null: false

      t.timestamps
    end
  end
end
