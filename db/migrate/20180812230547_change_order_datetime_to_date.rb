class ChangeOrderDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :orders, :date_made, :date
  end
end
