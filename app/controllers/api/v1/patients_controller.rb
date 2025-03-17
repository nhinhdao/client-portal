class Api::V1::PatientsController < Api::V1::ClientsController
  # get all dietitians of a patient
  def dietitians
    render json: @client.providers.where(type: "Dietitian")
  end
end
