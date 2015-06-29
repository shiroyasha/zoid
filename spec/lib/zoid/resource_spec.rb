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
    before do
      @resource = Zoid::Resource.new({"age" => 1})
    end

    context "attribute is not present in the resource" do
      it "raises false" do
        expect(@resource.has?(:name)).to eq(false)
      end
    end

    context "attribute is present in the resource" do
      it "returns true" do
        expect(@resource.has?(:age)).to eq(true)
      end
    end
  end

  describe "#methods" do
    before do
      @resource = Zoid::Resource.new({"age" => 1})
    end

    it "includes the resource's attributes" do
      expect(@resource.methods).to include(:age)
    end

    it "includes the standard method names" do
      expect(@resource.methods).to include(:instance_eval)
    end
  end

  describe "#inspect" do
    before do
      @resource = Zoid::Resource.new({"age" => 1})
    end

    it "hides the internal @attributes value" do
      expect(@resource.inspect).to_not match(/@attributes/)
    end

    it "includes the name of the class" do
      expect(@resource.inspect).to match(/Zoid::Resource/)
    end

    it "includes the attributes' keys" do
      expect(@resource.inspect).to match(/age/)
    end
  end

end
