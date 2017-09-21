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

# All the unit tests inside the following folder
spec/
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

## Test with Curl

```ruby
# Test if a word in current board
curl -H "Content-Type: application/json" -X GET -d '{"query":"tap"}' https://simple-boggle-api.herokuapp.com/boggles/check


# Get the current board
curl -H "Content-Type: application/json" -X GET https://simple-boggle-api.herokuapp.com/boggles/current_board

# Create new boggle

curl -H "Content-Type: application/json" -X POST -d '{"data":"T, A, P, *, E, A, K, S, O, B, R, S, S, *, X, D"}' https://simple-boggle-api.herokuapp.com/boggles
```

## Unit tests

```ruby
bundle exec rspec
```

## Improvement
* Clean up the algorithm for BoggleChecker
* Add more meaningful test case
* There're still many other thing can be improve. Such as: the API is very simple, or validation or check for bad data submit from user.

## Screenshots
![1](https://user-images.githubusercontent.com/2282642/30710069-89c5a7b6-9f2e-11e7-87b0-d2ec8675ede8.png)

![2](https://user-images.githubusercontent.com/2282642/30710067-896528e6-9f2e-11e7-9be1-25d3854e39f3.png)

![3](https://user-images.githubusercontent.com/2282642/30710068-899987d0-9f2e-11e7-87f1-a709fd2084f1.png)
