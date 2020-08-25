class AddCertificateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :certificate, :string, null: true, :limit => 100
  end
end
