class AddDefaultValueToVisits < ActiveRecord::Migration[5.2]
  def change
    change_column :sites, :visits, :integer, default: 0
  end
end
