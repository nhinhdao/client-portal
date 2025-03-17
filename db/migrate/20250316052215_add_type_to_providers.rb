class AddTypeToProviders < ActiveRecord::Migration[8.0]
  def change
    add_column :providers, :type, :string, null: false
    add_index :providers, :type
  end
end
