class Provider < ApplicationRecord
  # Provider name and email
  include Info

  # when a Provider is destroyed
  # all enrollments associated with that provider are destroyed
  has_many :enrollments, dependent: :destroy

  # Provider has many Clients through enrollments
  has_many :clients, through: :enrollments

  # Provider has many journal entries through clients, alias patients_journals
  has_many :patients_journals, through: :clients, source: :journal_entries
end
