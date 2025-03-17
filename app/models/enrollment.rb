class Enrollment < ApplicationRecord
  belongs_to :client
  belongs_to :provider

  # set default 'basic' plan if plan is nil or not valid
  before_validation :set_plan

  PLANS = [ "basic", "premium" ].freeze

  validates :plan, presence: true, inclusion: { in: PLANS }


  def set_plan
    self.plan = "basic" if plan.blank? || !PLANS.include?(self.plan)
  end
end
