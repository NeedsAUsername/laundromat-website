class GiveOrdersDroppedOff < ActiveRecord::Migration
  def change
    add_column :orders, :dropped_off, :boolean
  end
end
