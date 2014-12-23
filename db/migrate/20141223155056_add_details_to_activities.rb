class AddDetailsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :description, :string
    add_column :activities, :started_at, :datetime
    add_column :activities, :ended_at, :datetime
  end
end
