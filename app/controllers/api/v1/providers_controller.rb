class Api::V1::ProvidersController < ApplicationController
  # get provider by id, set it to instance variable
  # applies each time clients and clients_journals are executed
  before_action :set_provider, except: [ :create, :index ]

  # get all providers
  def index
    @provider = Provider.all
    render json: @provider
  end

  # create new Provider
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      render json: @provider, status: :created
    else
        render json: @provider.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  # find provider by id
  def set_provider
    @provider = Provider.find_by(id: params[:id])
  end

  # provider parameters
  def provider_params
    params.require(:provider).permit(:name, :email)
  end
end
