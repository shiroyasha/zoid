require "spec_helper"

describe Zoid::Resource do
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
