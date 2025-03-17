class Client < ApplicationRecord
    # when a client is destroyed
    # all journal entries associated with that client are destroyed
    has_many :journal_entries, dependent: :destroy

    # when a client is destroyed
    # all enrollments associated with that client are destroyed
    has_many :enrollments, dependent: :destroy

    # client has many providers through enrollments
    has_many :providers, through: :enrollments

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
