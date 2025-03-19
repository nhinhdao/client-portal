# Client Provider Portal

This API application allows users to query for Providers and Clients

### Set up application

Use Terminal or Command Prompt to navigate to the root project: `cd <path>/client-portal`

- Install dependencies and packages
    
    Follow the instructions at the end section of **Note PDF** to install

- Set Up the Database and created Test records. In the terminal run: 

    `rails db:create db:migrate db:seed`


### Run application

**Requirements:**
- Clients can post journal entries. These consist of freeform text.
- Find all clients for a particular provider
- Find all providers for a particular client
- Find all of a particular client's journal entries, sorted by date posted
- Find all of the journal entries of all of the clients of a particular provider, sorted by date posted


There are two ways to test this:
### 1. Using **Rails Console**
- In the terminal run: `rails c`
- View all patients: `Patient.all`
- View all dietitians: `Dietitian.all`
- Get a patient: `patient = Patient.first`
- Get a dietitian: `dietitian = Dietitian.first`
- Associate patient to dietitian: 

    `Enrollment.create(client_id: patient.id, provider_id: dietitian.id`
- Create a journal: 

    `patient.journal_entries.create(content: 'Roses are red')`
- View patient's journal entries: `patient.journal_entries`
- View patient's dietitians: `patient.dietitians`
- View dietitian's patients: `dietitian.patients`
- View dietitian all client's journal entries: `dietitian.patients_journals`

### 2. Using **Rails server**
- In the terminal run: `rails s` to start rails server locally
- Go to the url listed on the terminal. For example: Listening on http://127.0.0.1:3000
- Type each of the route in the browser at the end of the port and press Enter to see results;
- View all patients: `/api/v1/patients`
- View all dietitians: `/api/v1/dietitians`
- Note down the id of a patient and a dietitian.
- View patient's journal entries: 

    `/api/v1/patients/<patient id>/journal_entries`
- View patient's dietitians:

    `/api/v1/patients/<patient id>/dietitians`
- View dietitian's patients:

    `/api/v1/dietitians/<dietitian id>/patients`
- View dietitian all client's journal entries: 

    `/api/v1/dietitians/<dietitian id>/patients_journals`