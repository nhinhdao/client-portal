class CreateJournalEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :journal_entries do |t|
      t.references :client, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
