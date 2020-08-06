class CreateVr < ActiveRecord::Migration[6.0]
  def change
    create_table :vrs do |t|
      t.string :link, :limit => 200
      t.integer :vote, :default => 0

      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
