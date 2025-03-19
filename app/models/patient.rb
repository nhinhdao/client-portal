class Patient < Client
  # Patient inherits from Client model
  # Patient can be create by calling Patient.create(client_params)
  # or: Client.create(client_params, type: 'Patient')

  # Patient has many Dietitians through enrollments
  has_many :dietitians, -> { where(type: "Dietitian") }, through: :enrollments, source: :provider
end
