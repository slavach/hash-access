module HashAccess # :nodoc:
  VERSION = '0.3.0'

  # Extends the Hash class with the access_by_methods method.
  def self.included(base)
    Hash.send :include, HashAccess::InstanceMethods
  end

  # This module contains one method - access_by_methods instance method.
  # The access_by_methods is added to Hash when the module HashAccess
  # is being included.
  # When the access_by_methods is being called it generates a couple of
  # instance methods of the calling object:
  #
  # * access_by_methods?
  # * store, []=
  # * method_missing
  # * stringify_keys!
  module InstanceMethods
    # Generates singleton instance methods that allows access to any hash
    # element using a method with the same name as the key.
    # Recursively calls itlelf on child hashes.
    def access_by_methods
      return self if self.respond_to? :access_by_methods? and self.access_by_methods?
      class << self
        alias_method :__hash_store, :store
        alias_method :__hash_assign, :[]=

        # Generated instance method.
        # Hash elements can be accessed using methods.
        def access_by_methods?
          true
        end

        # Generated instance method.
        # Stores a key-value pair.
        def store(key, value)
          if value.is_a? Hash
            value.access_by_methods
          end
          key = key.to_s
          __hash_store(key, value)
        end # def store

        # Generated instance method.
        # Stores a key-value pair.
        def []=(key, value)
          self.store(key, value)
        end # def []=

        # Generated instance method.
        # Creates a new hash element with a key is the same as the passed
        # method.
        def method_missing(method, *values)
          method_name = method.to_s
          super(method, *values) unless method_name =~ /^[a-z0-9]+.*$/
          if method_name =~ /^.*=$/
            key = method_name.chop
            if values.size == 1
              self[key] = values[0]
            else
              self[key] = values
            end
          else
            self[method_name] = Hash.new.access_by_methods \
              unless self.keys.include?(method_name)
            self[method_name]
          end
        end # def method_missing

        # Generated instance method.
        # Converts all hash keys to strings.
        def stringify_keys!
          keys.each do |key|
            next if key.is_a? String
            self[key.to_s] = self[key]
            delete(key)
          end
          self
        end # def stringify_keys!
      end # class

      self.stringify_keys!

      # Recursive calls
      self.each do |key, value|
        if value.is_a? Hash
          value.access_by_methods
        end
      end

      self
    end # def access_by_methods
  end # module InstanceMethods
end # module HashAccess

