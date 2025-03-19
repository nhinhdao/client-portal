class Patient < Client
  # Patient inherits from Client model

  # Patient has many Dietitians (subset of Provider) through enrollments
  # has_many :dietitians, -> { where(type: "Dietitian") }, through: :enrollments, source: :provider
  has_many :dietitians, -> { where(type: "Dietitian") }, through: :enrollments, source: :provider
end
