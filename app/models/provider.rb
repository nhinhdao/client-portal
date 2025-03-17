class Provider < ApplicationRecord
  # when a Provider is destroyed
  # all enrollments associated with that provider are destroyed
  has_many :enrollments, dependent: :destroy

  # Provider has many Clients through enrollments
  has_many :clients, through: :enrollments

  # Provider has many journal entries through clients
  has_many :journal_entries, through: :clients

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
