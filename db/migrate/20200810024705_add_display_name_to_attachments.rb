class AddDisplayNameToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :display_name, :string, null: true, :limit => 200
  end
end
