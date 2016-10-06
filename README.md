# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Development Setup:
For testing purposes, I've used a gem called faker to generate all the data.

1. To install run 'gem install faker'
2. Then run a 'gem which faker to find where the faker gem is installed'
3. Run your rails console (rails c).
4. Type the lib directory enclosed in single quotes (e.g. '/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/faker-1.6.6/lib/') depending on where your faker gem is installed.
5. Type "require 'faker'" to display the current requirement status for the faker gem
6. Type true then return key. Done!
7. You should now be able to generate fake stuff as follows:

# Generate 30 participants with random names
>> 30.times do
>>    Participant.create(name: Faker::Name.name, gender: rand(0..3), contact_number: Faker::PhoneNumber.phone_number, home_address: Faker::Address.street_address, active: [true,false].sample, study_id: rand(1..4), date_of_birth: Faker::Date.backward(18.year), email: Faker::Internet.email())
>> end

# Generate 30 participants with game of thrones character names
>> 30.times do
>>    Participant.create(name: Faker::GameOfThrones.character, gender: rand(0..3), contact_number: Faker::PhoneNumber.phone_number, home_address: Faker::Address.street_address, active: [true,false].sample, study_id: rand(1..4), date_of_birth: Faker::Date.backward(18.year), email: Faker::Internet.email())
>> end

# Generate 500 notes from Star Wars quotes
>> 500.times do |n|
>>    Note.create(participant_id: rand(1..60), note_text: Faker::StarWars::quote, important: [true,false].sample, user_id: rand(1..2), notify_on: Faker::Date.forward(rand(7..25)))
>> end

# Generate 1200 notes each with 3 latin sentences. :)
>> 1200.times do
>>    Note.create(participant_id: rand(1..60), note_text: Faker::Lorem.sentence(3), important: [true,false].sample, user_id: rand(1..2), notify_on: Faker::Date.forward(rand(7..25)))
>> end


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
