require "spec_helper"

describe Zoid::Agent do

  describe "connection_builder", :vcr => { :cassette_name => "github/public_repo" } do
    it "invokes the passed block" do
      test = false

      github = Zoid::Agent.new("https://api.github.com") { |faraday| test = true }

      github.get "/repos/vmg/redcarpet/issues", {:state => "closed"}

      expect(test).to eq(true)
    end
  end

  describe "#get", :vcr => { :cassette_name => "github/public_repo" } do
    before do
      github_agent = Zoid::Agent.new("https://api.github.com")

      @response = github_agent.get "/repos/vmg/redcarpet/issues", {:state => "closed"}
    end

    it "returns a 'Zoid::Resource'" do
      expect(@response).to be_instance_of(Zoid::Response)
    end

    it "saves the http status" do
      expect(@response.status).to eq(200)
    end
  end
end
