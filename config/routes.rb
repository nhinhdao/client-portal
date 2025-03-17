Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      # api/v1/dietitians
      resources :dietitians, only: [ :show ] do
        member do
          # api/v1/dietitians/<provider_id>/patients
          get "patients", to: "dietitians#patients"

          # api/v1/dietitians/<provider_id>/patients_journals
          get "patients_journals", to: "dietitians#patients_journals"
        end
      end

      # api/v1/patients
      resources :patients, only: [ :show ] do
        member do
          # api/v1/patients/:client_id/providers
          get "dietitians" => "patients#dietitians"

          # api/v1/patients/:client_id/journal_entries
          get "journal_entries", to: "patients#journal_entries"
        end
      end


      # api/v1/journal_entries
      resources :journal_entries, only: [ :create ]
    end
  end
end
