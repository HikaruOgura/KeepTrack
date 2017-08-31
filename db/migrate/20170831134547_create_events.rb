class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title,null:false,default: "無題"
      t.integer :amount , null: false
      t.date :day ,null:false
      t.timestamps null: false
    end
  end
end
