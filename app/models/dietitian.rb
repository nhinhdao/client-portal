class Dietitian < Provider
  # Dietitian inherits from Provider model

  # Dietitian has many Patients (subset of clients) through enrollments
  has_many :patients, -> { where(type: "Patient") }, through: :enrollments, source: :client

  # Dietitian has many journal entries through clients, alias patients_journals
  has_many :patients_journals, through: :patients, source: :journal_entries
end
