class AddClosedToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :closed, :boolean, default: false
  end
end
