class Api::V1::ClientsController < ApplicationController
  # get client by id and set it to class instance variable
  # applies each time providers and journal_entried are executed
  before_action :set_client, except: [ :create, :index ]

  # get all providers
  def index
    @client = Client.all
    render json: @client
  end

  # create new client
  def create
    @client = Client.new(client_params)
    if @client.saves
      render json: @client, status: :created
    else
      render json: @client.errors.full_messages, status: :unprocessable_entity
    end
  end

  # get all journal entries of a client
  def journal_entries
    journalEntries = @client.journal_entries
    render json: journalEntries
  end

  private

  # find client by id
  def set_client
    @client = Client.find_by(id: params[:id])
  end

  # client params
  def client_params
    params.require(:client).permit(:name, :email)
  end
end
