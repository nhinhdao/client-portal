class JournalEntry < ApplicationRecord
  # order by date posted by default
  default_scope { order(created_at: :desc) }

  belongs_to :client

  validates :content, presence: true
end
