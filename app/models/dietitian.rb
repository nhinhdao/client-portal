class Dietitian < Provider
  # Dietitian inherits from Provider model
  # Dietitian can be create by calling Dietitian.create(provider_params)
  # or: Provider.create(provider_params, type: 'Dietitian')

  # Dietitian has many Patients through enrollments
  has_many :patients, -> { where(type: "Patient") }, through: :enrollments, source: :client

  # Dietitian has many journal entries through clients, alias patients_journals
  has_many :patients_journals, through: :clients, source: :journal_entries
end
