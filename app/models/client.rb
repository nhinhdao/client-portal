class Client < ApplicationRecord
    # Client name and email
    include Info

    # when a client is destroyed
    # all journal entries associated with that client are destroyed
    has_many :journal_entries, dependent: :destroy

    # when a client is destroyed
    # all enrollments associated with that client are destroyed
    has_many :enrollments, dependent: :destroy

    # client has many providers through enrollments
    has_many :providers, through: :enrollments
end
