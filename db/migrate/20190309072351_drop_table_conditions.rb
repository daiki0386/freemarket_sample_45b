class DropTableConditions < ActiveRecord::Migration[5.0]
  def change
    drop_table :conditions
  end
end
