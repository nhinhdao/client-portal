class Api::V1::EnrollmentsController < ApplicationController
  # get all dietitians of a patient
  def create
    @enrollment = Enrollment.new(enrollment_params)
    begin
      if @enrollment.save
        render json: @enrollment, status: :created
      else
        render json: @enrollment.errors.full_messages, status: :unprocessable_entity
      end

    rescue ActiveRecord::RecordNotUnique
      render json: { errors: [ "Enrollment already exists for this client and provider. Consider change plan." ] },
            status: :unprocessable_entity
    end
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:provider_id, :client_id, :plan)
  end
end
