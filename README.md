# NLBSG

Welcome to NLBSG!

This gem interacts with the Singapore National Library (NLB) API. 

>More information on accepted parameters and responses are available at https://opendata.nlb.gov.sg/content/SkillsFuture/NLB_Labs_TechDoc-V3.6.pdf



Obtain an API key at

 https://www.nlb.gov.sg/GetInvolved/ContributeCreate/NLBlabs.aspx


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nlbsg'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nlbsg

# Usage

## Initialize
Use your own API Key as NLBSG_KEY
```ruby
client = NLBSG.client(key: NLBSG_KEY, env: :production)
```

<br>

## Search
The `Search` method requires **at least one** parameter below and looks for books in the NLB database matching the search criteria.
```ruby
client.search(title: "search string")
```
| Parameter | Data Type | Usage                        |
| --------- | --------- | ---------------------------- |
| title     | String    | `title: "search string"`     |
| keywords  | String    | `keywords: "keyword string"`|
| author    | String    | `author: "author string"`    |
| subject   | String    | `subject: "subject string"`  |


<br>

## Get Availability Info
The `Get Availability Info` method requires **at least one** parameter below and checks whether a book is available for loaning.
```ruby
client.get_availability_info(BID: "BID string")
```
| Parameter | Data Type | Usage                        |
| --------- | --------- | ---------------------------- |
| BID       | String    | `BID: "BID string"`          |
| ISBN      | String    | `ISBN: "ISBN string"`        |

<br>

## Get Title Details
The `Get Title Details` method requires **at least one** parameter below and returns with more details on the specified title.
```ruby
client.get_title_details(BID: "BID string")
```
| Parameter | Data Type | Usage                        |
| --------- | --------- | ---------------------------- |
| BID       | String    | `BID: "BID string"`          |
| ISBN      | String    | `ISBN: "ISBN string"`        |



<br>

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pest-control/nlbsg.

<br>

# License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
