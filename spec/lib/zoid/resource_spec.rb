require "spec_helper"

describe Zoid::Resource do
  describe "#method_missing" do
    context "attribute is not present in the resource" do
      it "raises an exception" do
        resource = Zoid::Resource.new({"a" => 1})
        expect { resource.b }.to raise_exception(NoMethodError)
      end
    end

    context "attribute is present in the resource" do
      it "returns that attribute" do
        resource = Zoid::Resource.new({"a" => 1})

        expect(resource.a).to eq(1)
      end
    end
  end

  describe "#has?" do
    context "attribute is not present in the resource" do
      it "raises false" do
        resource = Zoid::Resource.new({"a" => 1})
        expect(resource.has?(:b)).to eq(false)
      end
    end

    context "attribute is present in the resource" do
      it "returns true" do
        resource = Zoid::Resource.new({"a" => 1})

        expect(resource.has?(:a)).to eq(true)
      end
    end
  end

  describe "#methods" do
    it "includes the resource's attributes" do
      resource = Zoid::Resource.new({"age" => 1})

      expect(resource.methods).to include(:age)
    end

    it "includes the standard method names" do
      resource = Zoid::Resource.new({"age" => 1})

      expect(resource.methods).to include(:instance_eval)
    end
  end

end
