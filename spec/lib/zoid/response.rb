require "spec_helper"

describe Zoid::Response do

  describe "#status" do
    it "returns the provided status" do
      response = Zoid::Response.new(300, {})

      expect(response.status).to eq(300)
    end
  end

  describe "#body" do
    context "body is a simple flat hash" do
      it "converts the body into a Resource" do
        response = Zoid::Response.new(300, {:a => "1", "b" => 4})

        expect(response.body).to be_instance_of(Zoid::Resource)
      end
    end

    context "body is a simple flat array" do
      it "converts the body into a Resource" do
        response = Zoid::Response.new(300, ["1", "2", 3])

        expect(response.body).to eq(["1", "2", 3])
      end
    end

    context "body is a simple value" do
      it "returns that value" do
        response = Zoid::Response.new(300, "1")

        expect(response.body).to eq("1")
      end
    end

    context "body is an array with nested hashes" do
      it "converts the hashes into Zoid::Resources" do
        response = Zoid::Response.new(300, [1, {:a => 2}])

        expect(response.body[0]).to eq(1)
        expect(response.body[1]).to be_instance_of(Zoid::Resource)
      end
    end

    context "body is hash with nested hashes" do
      before do
        @response = Zoid::Response.new(300, {:a => 1, :b => {:c => 2}})
      end

      it "converts the hash into a Zoid::Resources" do
        expect(@response.body).to be_instance_of(Zoid::Resource)
      end

      it "does not convert simple values" do
        expect(@response.body.a).to eq(1)
      end

      it "converts the subhash into a Zoid::Resources" do
        expect(@response.body.b).to be_instance_of(Zoid::Resource)
      end
    end
  end

end
