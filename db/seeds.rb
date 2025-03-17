# Seed data to help with test purposes

# Clear out existing records to prevent duplicating
Enrollment.delete_all
JournalEntry.delete_all
Provider.delete_all
Client.delete_all

# Create Patients (subclass of Clients)
frodo = Patient.create!(name: 'Frodo Baggins', email: 'frodo.baggins@theshire.com')
merry = Patient.create!(name: 'Merry Brandybuck', email: 'merry.brandybuck@theshire.com')
sam = Patient.create!(name: 'Sam Gamgee', email: 'sam.gamgee@theshire.com')
pippin = Patient.create!(name: 'Pippin Took', email: 'pippin.took@theshire.com')

# Create Journal Entries
frodo.journal_entries.create!(content: 'I wish the Ring had never come to me')
frodo.journal_entries.create!(content: 'I will take the Ring, though I do not know the way.')
merry.journal_entries.create!(content: "There Won't Be a Shire, Pippin.")
merry.journal_entries.create!(content: 'This, My Friend, Is a Pint.')
sam.journal_entries.create!(content: 'Do You Remember The Taste Of Strawberries?')
sam.journal_entries.create!(content: 'Po-tay-toes')
pippin.journal_entries.create!(content: 'What About Second Breakfast?')
pippin.journal_entries.create!(content: 'We Have No Songs Fit for Great Halls and Evil Times.')

# Create Dietitians (subclass of Providers)
gandalf = Dietitian.create!(name: 'Gandalf', email: 'gandalf@valinor.com')
saruman = Dietitian.create!(name: 'Saruman', email: 'saruman@valinor.com')
elrond = Dietitian.create!(name: 'Elrond', email: 'elrond@rivendell.com')
gollum = Dietitian.create!(name: 'Gollum', email: 'gollum@gladdenfields.com')

# Create Enrollments between Patients and Dietitians
Enrollment.create!(client_id: frodo.id, provider_id: gandalf.id, plan: 'premium')
Enrollment.create!(client_id: frodo.id, provider_id: gollum.id, plan: 'premium')
Enrollment.create!(client_id: frodo.id, provider_id: saruman.id, plan: 'premium')
Enrollment.create!(client_id: merry.id, provider_id: elrond.id, plan: 'basic')
Enrollment.create!(client_id: sam.id, provider_id: saruman.id, plan: 'basic')
Enrollment.create!(client_id: pippin.id, provider_id: elrond.id, plan: 'basic')
Enrollment.create!(client_id: pippin.id, provider_id: gandalf.id, plan: 'basic')
Enrollment.create!(client_id: sam.id, provider_id: gollum.id, plan: 'premium')
