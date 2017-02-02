require 'rails_helper'

describe GithubService do
  context ".request_user(login)" do
    it "returns basic user info on login" do
      VCR.use_cassette("github_returns_user_info") do
        raw_user = GithubService.request_user("Sh1pley")


        expect(raw_user).to be_a(Hash)
        expect(raw_user).to have_key(:public_repos)
        expect(raw_user).to have_key(:followers)
        expect(raw_user).to have_key(:following)
        expect(raw_user[:public_repos]).to be_a(Integer)
      end
    end
  end
  context ".request_repos(login)" do
    it "returns repos on login info" do
      VCR.use_cassette("github_returns_repos") do
        raw_repos = GithubService.request_repos("Sh1pley")
        expect(raw_repos).to be_a(Array)
        raw_repo = raw_repos.first
        
        expect(raw_repo).to be_a(Hash)
        expect(raw_repo).to have_key(:name)
        expect(raw_repo).to have_key(:description)
        expect(raw_repo).to have_key(:html_url)
        expect(raw_repo).to have_key(:language)
        expect(raw_repo[:name]).to be_a(String)
      end
    end
  end
  context ".get_repo(repo_name, login)" do
    it 'returns the correct repo' do
      VCR.use_cassette("github_returns_single_repo") do
        raw_repo = GithubService.get_repo("99_bottles", "Sh1pley")
        
        expect(raw_repo).to be_a(Hash)
        expect(raw_repo[:name]).to eq("99_bottles")
        expect(raw_repo[:language]).to eq("Ruby")
        expect(raw_repo[:description]).to be_a(String)
      end
    end
  end
end