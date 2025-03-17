class AddIndexToEnrollments < ActiveRecord::Migration[8.0]
  def change
    add_index :enrollments, [ :client_id, :provider_id ], unique: true
  end
end
