class MofifyEvents < ActiveRecord::Migration
  def change
      add_reference :events,:user  ,foreign_key: true
      add_reference :money , :user,foreign_key:true
  end
end
