class AddIndexToJournalEntries < ActiveRecord::Migration[8.0]
  def change
    add_index :journal_entries, [ :client_id, :created_at ]
  end
end
