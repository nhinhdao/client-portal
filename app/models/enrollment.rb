class Enrollment < ApplicationRecord
  attribute :plan, :string
  belongs_to :client
  belongs_to :provider

  # Enrollment has 2 plans: basic and premium
  enum :plan, {
    basic: "basic",
    premium: "premium"
  }, default: "basic"

  # set default 'basic' plan if plan is nil or not valid
  before_validation :set_plan

  validates :plan, presence: true, inclusion: { in: %w[basic premium] }

  def set_plan
    self.plan ||= "basic"
  end
end
