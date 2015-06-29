require "spec_helper"

describe Zoid::Resources do

  before do
    @person1 = Zoid::Resource.new({"name" => "Aleksandar"})
    @person2 = Zoid::Resource.new({"name" => "Igor"})
    @person3 = Zoid::Resource.new({"name" => "Ervin"})
    @person4 = Zoid::Resource.new({"name" => "Nebojsa"})

    @people = Zoid::Resources.new([@person1, @person2, @person3, @person4])
  end

  it "supports select" do
    expect(@people.select { |person| person.name == "Nebojsa" }).to eq([@person4])
  end

  it "supports indexing" do
    expect(@people[1]).to eq(@person2)
  end

  it "can tell its length" do
    expect(@people.length).to eq(4)
  end

  it "supports map" do
    expect(@people.map(&:name)).to eq(["Aleksandar", "Igor", "Ervin", "Nebojsa"])
  end

  describe "#find_by" do
    context "when the field exists" do
      context "when there is a resource with such attribute" do
        it "finds the resources that match the criteria" do
          expect(@people.find_by(:name => "Ervin")).to eq(@person3)
        end
      end

      context "when there is no resource with such attribute" do
        it "returns nil" do
          expect(@people.find_by(:name => "Petar")).to eq(nil)
        end
      end
    end

    context "when the field doesn't exists" do
      it "raises an exception" do
        expect { @people.find_by(:age => 23) }.to raise_exception(NoMethodError)
      end
    end
  end

end
