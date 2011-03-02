require 'rspec'
require File.dirname(__FILE__) + "/../lib/hash_access.rb"
include HashAccess

describe HashAccess do
  describe "new empty Hash instance" do
    it "responds to :access_by_methods" do
      @hash = Hash.new
      @hash.respond_to?(:access_by_methods).should == true
    end
  end

  describe "new empty Hash instance after the call to access_by_methods" do
    before :each do
      @hash = Hash.new
      @hash.access_by_methods
    end

    it "responds to :access_by_methods?" do
      @hash.respond_to?(:access_by_methods?).should == true
    end

    it "responds to :stringify_keys!" do
      @hash.respond_to?(:stringify_keys!).should == true
    end
  end

  describe "non-empty Hash instance after the call to access_by_methods" do
    before :each do
      @hash = Hash.new
      @hash[:qwe] = 'qwe_value'
      @hash[:asd] = {}
      @hash[:asd][:fgh] = :asd_fgh_value
      @hash['zxc'] = {}
      @hash['zxc']['vbn'] = 'zxc_vbn_value'
      @hash.access_by_methods
    end

    it "changes symbol-type keys to strings" do
      @hash.keys.sort.should == %w( asd qwe zxc )
    end

    it "returns a value when being call to a method" do
      @hash.qwe.should == 'qwe_value'
      @hash.asd.fgh.should == :asd_fgh_value
      @hash.zxc.vbn.should == 'zxc_vbn_value'
    end

    it "changes a value" do
      @hash.qwe = 'new_qwe_value'
      @hash.qwe.should == 'new_qwe_value'
    end

    it "creates a new value when being call to a method" do
      @hash.qwerty.asdfgh.zxcvbn = 'qwertyuiop'
      @hash.qwerty.asdfgh.zxcvbn.should == 'qwertyuiop'
    end

    it "replaces the existing value" do
      @hash.qwe = 'new_qwe_value'
      @hash.qwe.should == 'new_qwe_value'
    end

    it "it replaces the existing parent element" do
      @hash.qwerty.asdfgh.zxcvbn.qwerty.asdfgh.zxcvbn = 'qwertyuiop'
      @hash.qwerty.asdfgh.zxcvbn = 'qwerty_asdfgh_zxcvbn'
    end
  end

  describe "child hash" do
    before :each do
      @hash = {}
      @hash.access_by_methods
      @hash.qwe.asd = 'qwe_asd_value'
      @child = @hash.qwe
    end
    it "responds to access_by_methods?" do
      @child.respond_to?(:access_by_methods?).should == true
    end

    it "returns a value when being call to a method" do
      @child.asd.should == 'qwe_asd_value'
    end

    it "creates a new element when being call to a method" do
      @child.zxc = 'zxc_value'
      @child.zxc.should == 'zxc_value'
    end
  end
end

