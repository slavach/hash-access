# HashAccess

HashAccess allows access to hash elements by calling methods. When using
HashAccess you can call a method on a hash instance to get the value of a key.

You can write:

    hash.some_key = 'something'

instead of:

    hash['some_key'] = 'something'

## Installation

The latest source from GitHub:

    git clone https://github.com/slavach/hash-access.git

The older version from gem:

    gem install hash-access

## Testing

The latest versions, starting with 0.3.0, use RSpec test framework.
You have to install rspec gem if you wish to run the tests.

To invoke tests - run `rake spec` or simply `rake`.

## Usage example

    require 'hash_access'
    include HashAccess

    h = {}
    h.access_by_methods
    h.first_key = 'First value' # the same as h['first_key'] = 'First value'
    h.another_key = 'Another value' # the same as h['another_key'] = 'Another value'

## Author

HashAccess has been written by Svetoslav Chernobay <slava@chernobay.info>.
Feel free to contact him if you have any questions or comments.

## Notes

HashAccess have been written as a supplement module for UseConfig module, but
could be used standalone.

UseConfig is available as the gem use-config. I'm going to submit its code
to GitHub.

