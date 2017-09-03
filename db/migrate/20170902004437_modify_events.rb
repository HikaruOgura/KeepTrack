class ModifyEvents < ActiveRecord::Migration
  def change
      add_column :events, :recorded, :boolean,default:0
      
  end
end
