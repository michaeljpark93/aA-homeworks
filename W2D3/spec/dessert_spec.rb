require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:ice_cream) { Dessert.new("ice cream", 10, :chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(ice_cream.type).to eq("ice cream")
    end

    it "sets a quantity" do
      expect(ice_cream.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(ice_cream.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { ice_cream.quantity("lots") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(ice_cream.ingredients).to_not include("sprinkles")
      ice_cream.add_ingredient("sprinkles")
      expect(ice_cream.ingredients).to include("sprinkles")
    end
  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
      ingredients = ["caramel", "chocolate", "jbeans", "sprinkles", "whippedc"]
      ingredients.each { |ingredient| ice_cream.add_ingredient(ingredient) }

      expect(ice_cream.ingredients).to eq(ingredients)
      ice_cream.mix!
      expect(ice_cream.ingredients).to_not eq(ingredients)
      expect(ice_cream.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(ice_cream.quantity).to eq(10)
      ice_cream.eat(2)
      expect(ice_cream.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { ice_cream.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(ice_cream.serve).to include(chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(ice_cream)
      ice_cream.make_more
    end
  end
end
