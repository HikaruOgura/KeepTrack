class ModifyEvents2 < ActiveRecord::Migration
  def change
      add_column :events, :debit, :boolean,default:0
  end
end
