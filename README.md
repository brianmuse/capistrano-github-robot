# Capistrano Github Robot

*Note: Functionality is really limited and settings are a little haphazard at the moment. Plan on the implementation changing in the future.*

Currently only comments on pull requests. When you are continuously deploying pull requests for end to end testing, this script can post a message to the PR issue upon completing the deployment.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-github-robot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-github-robot

## Usage

Add the following to your capfile:
```Ruby
require 'capistrano-github-robot'
```

The following options are available:
```Ruby
set :pull_request_number, '[string]'    		#required (the PR issue to post to)
set :github_token, '[string]' 					#required (The oauth token for the user which will post the comment)
set :target_comment_repository, '[string]'      #required (eg. 'my-account/my-repository')
set :post_github_comment, '[string]'   			#required (Toggles posting on/off)
set :comment_body, '[string]'       			#required (The comment body)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
