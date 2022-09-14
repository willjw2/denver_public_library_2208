require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Book do
  describe '#initialize' do
    it "exists" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte).to be_an_instance_of(Author)
    end
    it "has readable attributes" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
      expect(charlotte_bronte.books).to eq([])
    end
  end
  describe '#write' do
    it "can write a new book" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(jane_eyre.class).to eq(Book)
      expect(jane_eyre.title).to eq("Jane Eyre")
    end
    it "can write multiple books" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end
