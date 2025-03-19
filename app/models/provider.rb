class Provider < ApplicationRecord
  # Provider name and email
  include Info

  # when a Provider is destroyed
  # all enrollments associated with that provider are destroyed
  has_many :enrollments, dependent: :destroy

  # Provider has many Clients through enrollments
  has_many :clients, through: :enrollments

  # Provider has many journal entries through clients, Indirect many to many association
  has_many :journal_entries, through: :clients
end
