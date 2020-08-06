class CreateSetting < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :key, :limit => 200
      t.string :value, :limit => 200

      t.timestamps
    end
  end
end
