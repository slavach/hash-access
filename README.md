# HashAccess

[HashAccess](https://github.com/slavach/hash-access) allows access to hash
elements by calling methods. When using HashAccess you can call a method
on a hash instance to get the corresponding value of a key.

You can write:

    hash.some_key = 'something'

instead of:

    hash['some_key'] = 'something'

## Installation

Hash access is available as the gem hash-access.

    gem install hash-access

## Usage Example

    require 'hash_access'
    include HashAccess

    h = {}
    h.access_by_methods
    h.first_key = 'First value' # the same as h['first_key'] = 'First value'
    h.another_key = 'Another value' # the same as h['another_key'] = 'Another value'

## Development

Clone hash-access source from GitGub:

    git clone git://github.com/slavach/hash-access.git

Install bundler if it has not been installed yet:

    gem install bundler

Install additional gems for testing and documentation:

    bundle install

The above command installs gems: rspec, rdoc, yard, BlueCloth.

To invoke tests - run `rake spec` or simply `rake`.

## Author

HashAccess has been written by Svetoslav Chernobay <slava@chernobay.info>.
Feel free to contact him if you have any questions or comments.

## Notes

HashAccess is a supplement module for UseConfig which is available at
GutHub [use-config](https://github.com/slavach/use-config) as well as the gem use-config.

