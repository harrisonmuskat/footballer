## Footballer

This app allows you to keep track of your fantasy football teams across the numerous available fantasy sites.

## External sources
Launch Academy's [sinatra-activerecord-starter-kit](https://github.com/LaunchAcademy/sinatra-activerecord-starter-kit)

## To use
- Clone the repo
- Change into the repo directory and run `bundle`

After bundling, rake commands should be available (run `rake -T` for the list) and you can build and seed the database with test data.

## Flash Notices

Uses [Sinatra Flash](https://github.com/SFEley/sinatra-flash)

Flash messages allow you to send information across page redirects. However, only short messages may be sent. Long messages or large objects tend to result in the Flash messages being cleared. In the `/app/views/layout.erb`, a message box for `flash[:notice]` has already been added.

**Example:**
```ruby
# app.rb

post '/books' do
  # do some logic like save something to the database
  flash[:notice] = "Your book was saved!"

  redirect '/books/all'
end

get '/books/all' do
  # Some code or logic to get all books

  erb :'books/index'
  # Flash message will appear on this page
end

# HEADS UP - flash does not work if returning a view
get '/books/all' do
  flash[:notice] = "This will not appear on the page."

  erb :'/books/index'
  # No flash message will appear until you navigate to a new page or the page refreshes.
end
```

## Shoulda Matchers

Uses [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)

Shoulda Matchers allow for easier testing of Model associations in your unit tests using RSpec.

**Example:**

```ruby
# /spec/models/user_spec.rb

require 'spec_helper'
# In this example, a user can have many books,
# but may only belong to a single library.
describe User do
  it { should belong_to :library }
  it { should have_many :books }
end

```

```ruby
# /app/models/user.rb

class User < ActiveRecord::Base
  # Note the difference in "belongs_to" here vs. "belong_to" in the spec test.
  belongs_to :library
  has_many :books
end
```

## Valid Attribute

Uses [Valid Attribute](https://github.com/bcardarella/valid_attribute)

Valid Attribute allows for the rapid development of tests for validations
in your models.

**Example:**

```ruby
# /spec/models/user_spec.rb

describe User do
  it { should have_valid(:username).when("valid_username", "another_valid_username") }
  it { should_not have_valid(:username).when('', nil) }
end

```

```ruby
# /app/models/user.rb

class User < ActiveRecord::Base
  validates :username, presence: true
end
```
