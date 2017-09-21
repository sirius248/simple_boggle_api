# Simple Boggle API

[![Code Climate](https://codeclimate.com/github/kimquy/simple_boggle_api/badges/gpa.svg)](https://codeclimate.com/github/kimquy/simple_boggle_api)

[![Build Status](https://travis-ci.org/kimquy/simple_boggle_api.svg?branch=master)](https://travis-ci.org/kimquy/simple_boggle_api)

## Main files

```ruby
# The main implementation will be inside the following files

app/controllers/boggles_controller.rb
app/models/boggle.rb
app/services/board_factory.rb
app/services/boggle_checker.rb
app/services/boggle_finder.rb
app/services/null_boggle.rb
lib/boggle_dictionary.rb
```

## API

```ruby
# Create new boggle
POST /boggles
{
  data: "T, A, P, *, E, A, K, S, O, B, R, S, S, *, X, D"
}

# Query current boggle board
GET /boggles/current_board

# Check if a word in current boggle board
GET /boggles/check?query={query}
```

## Unit tests

```ruby
bundle exec rspec
```

## Improvement
* Clean up the algorithm for BoggleChecker
* Add more meaningfull test case

## Screenshots
![1](https://user-images.githubusercontent.com/2282642/30710069-89c5a7b6-9f2e-11e7-87b0-d2ec8675ede8.png?s=200)
