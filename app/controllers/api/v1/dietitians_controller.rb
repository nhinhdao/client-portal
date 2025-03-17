class Api::V1::DietitiansController < Api::V1::ProvidersController
  # get all clients of a provider
  def patients
    render json: @provider.clients.where(type: "Patient")
  end


  # all journal entries of all clients of a provider
  # result is sorted by date posted
  def patients_journals
    patientJournals = @provider.journal_entries
    render json: patientJournals
  end
end
