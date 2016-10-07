# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Development Setup:
For testing purposes, I've used a gem called faker to generate all the data.

1. To install run 'gem install faker'
2. Then run a 'gem which faker to find where the faker gem is installed'
3. Run your rails console (rails c).
4. Type the string "$: << " followed by the lib directory enclosed in single quotes (e.g. '/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/faker-1.6.6/lib/') depending on where your faker gem is installed.


Sample Rails Console:


2.3.1 :004 > $: << '/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/faker-1.6.6/lib/'
 => ["/Users/dexterg/Code/neura-loggr/lib", "/Users/dexterg/Code/neura-loggr/vendor", "/Users/dexterg/Code/neura-loggr/app/assets", "/Users/dexterg/Code/neura-loggr/app/channels", "/Users/dexterg/Code/neura-loggr/app/controllers", "/Users/dexterg/Code/neura-loggr/app/controllers/concerns", "/Users/dexterg/Code/neura-loggr/app/helpers", "/Users/dexterg/Code/neura-loggr/app/jobs", "/Users/dexterg/Code/neura-loggr/app/mailers", "/Users/dexterg/Code/neura-loggr/app/models", "/Users/dexterg/Code/neura-loggr/app/models/concerns", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/turbolinks-5.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/jquery-rails-4.2.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/jquery-rails-4.2.1/vendor", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/coffee-rails-4.2.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/actioncable-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/bundler-1.13.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/spring-1.7.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/will_paginate-3.1.3/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/web-console-3.3.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/uglifier-3.0.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/turbolinks-source-5.0.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/sqlite3-1.3.11/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/sqlite3-1.3.11", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/spring-watcher-listen-2.0.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/sass-rails-5.0.6/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/tilt-2.0.5/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/sass-3.4.22/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rails-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/sprockets-rails-3.2.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/sprockets-3.7.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/puma-3.6.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/puma-3.6.0", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/listen-3.0.8/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rb-inotify-0.9.7/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rb-fsevent-0.9.7/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/jbuilder-2.6.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/multi_json-1.12.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/ffi-1.9.14/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/ffi-1.9.14", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/debug_inspector-0.0.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/debug_inspector-0.0.2", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/railties-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/thor-0.19.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/method_source-0.8.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/coffee-script-2.4.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/execjs-2.7.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/coffee-script-source-1.10.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/byebug-9.0.5/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/byebug-9.0.5", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/activerecord-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/arel-7.1.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/activemodel-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/actionmailer-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/mail-2.6.4/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/mime-types-3.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/mime-types-data-3.2016.0521/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/activejob-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/globalid-0.3.7/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/websocket-driver-0.6.4/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/websocket-driver-0.6.4", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/websocket-extensions-0.1.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/nio4r-1.2.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/nio4r-1.2.1", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/actionpack-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rack-test-0.6.3/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rack-2.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/actionview-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rails-html-sanitizer-1.0.3/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/loofah-2.0.3/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rails-dom-testing-2.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/nokogiri-1.6.8/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/extensions/x86_64-darwin-15/2.3.0/nokogiri-1.6.8", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/pkg-config-1.1.7/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/mini_portile2-2.1.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/erubis-2.7.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/builder-3.2.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/activesupport-5.0.0.1/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/tzinfo-1.2.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/thread_safe-0.3.5/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/minitest-5.9.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/i18n-0.7.0/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/concurrent-ruby-1.0.2/lib", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/rake-11.3.0/lib", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/site_ruby/2.3.0", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/site_ruby/2.3.0/x86_64-darwin15", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/site_ruby", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/vendor_ruby/2.3.0", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/vendor_ruby/2.3.0/x86_64-darwin15", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/vendor_ruby", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/2.3.0", "/Users/dexterg/.rvm/rubies/ruby-2.3.1/lib/ruby/2.3.0/x86_64-darwin15", "/Users/dexterg/.rvm/gems/ruby-2.3.1/gems/faker-1.6.6/lib/"] 

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
