require "spec_helper"

describe Zoid::Agent do

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
