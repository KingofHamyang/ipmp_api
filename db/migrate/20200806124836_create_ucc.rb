class CreateUcc < ActiveRecord::Migration[6.0]
  def change
    create_table :uccs do |t|
      t.string :link, :limit => 200
      t.longtext :title
      t.longtext :description
      t.integer :vote, default: 0

      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
