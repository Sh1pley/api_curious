require 'rails_helper'

describe 'GithubRepo' do
  let!(:user) { create(:user, login: "Sh1pley")}
  context '.gather_repos(login)' do
    it 'gathers from github services' do
      VCR.use_cassette("github_get_repos") do
        results = GithubRepo.gather_repos(user)

        expect(results).to be_a(Array)
        repo = results.first

        expect(repo.name).to be_a(String)
        expect(repo.url).to be_a(String)
        expect(repo.updated_at).to be_a(String)
        expect(repo.language).to be_a(String)
      end
    end
  end
end