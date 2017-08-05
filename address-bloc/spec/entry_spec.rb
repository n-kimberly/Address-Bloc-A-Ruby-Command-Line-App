
# Use require_relative to load our entry model for testing.
# Thie file is a spec file. It tests entry.
require_relative '../models/entry'

# We are using RSpec to test our code (i.e. $ rspec spec/entry_spec.rb )
RSpec.describe Entry do
  # 'describe' lists the attributes we want to test.
  describe "attributes" do
    let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
    # Separate out individual tests with 'it' method.
    it "responds to name" do
      expect(entry).to respond_to(:name)
    end
    it "returns correct name" do
      expect(entry.name).to eq('Ada Lovelace')
    end
    it "responds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end
    it "returns correct phone number" do
      expect(entry.phone_number).to eq('010.012.1815')
    end
    it "responds to email" do
      expect(entry).to respond_to(:email)
    end
    it "returns correct email" do
      expect(entry.email).to eq('augusta.king@lovelace.com')
    end

  end

  describe "#to_s" do
    it "prints entry as string" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expected_string = "Name: Ada Lovelace \nPhone Number: 010.012.1815 \nEmail: augusta.king@lovelace.com"
      expect(entry.to_s).to eq(expected_string)
    end
  end

end
