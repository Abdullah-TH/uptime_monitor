class AddMonitoringToDomains < ActiveRecord::Migration[7.2]
  def change
    add_column :domains, :monitoring, :boolean, default: false
  end
end
