class Api::V1::JournalEntriesController < ApplicationController
  def index
    render json: JournalEntry.all
  end

  # create new entry
  def create
    @entry = JournalEntry.new(journal_entry_params)

    if @entry.save
      render json: @entry, status: :created
    else
      render json: @entry.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  # journal entry parameters
  def journal_entry_params
    params.require(:journal_entry).permit(:client_id, :content)
  end
end
