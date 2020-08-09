class AddTimestampsToNotices < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :notices, null: true
  end
end
