class AddDefaultPlanToEnrollments < ActiveRecord::Migration[8.0]
  def change
    change_column_default :enrollments, :plan, 'basic'
  end
end
