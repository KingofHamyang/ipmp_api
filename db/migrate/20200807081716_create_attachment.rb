class CreateAttachment < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :file_name, :limit => 200

      t.references :notice, foreign_key: true

      t.timestamps
    end
  end
end
