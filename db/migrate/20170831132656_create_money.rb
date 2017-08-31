class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.integer :wallet, null: false
      t.integer :bank, null: false
      t.timestamps null: false
    end
  end
end
