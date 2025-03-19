module Info
  extend ActiveSupport::Concern

  # extract common attribute validation into a shared concern
  included do
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
  end
end
