class AddTypeToClients < ActiveRecord::Migration[8.0]
  def change
    add_column :clients, :type, :string, null: false
    add_index :clients, :type
  end
end
