require 'rails_helper'

describe 'GithubRepo' do
  let!(:user) { create(:user, login: "Sh1pley", token: "d2aa7244db825ceba114450f449b6500d92f2950")}
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
  context '.get_repo(repo_name, login)' do
    it 'gets a repo from github services' do
      VCR.use_cassette("github_get_single_repo") do
        repo = GithubRepo.get_repo("99_bottles", user)

        expect(repo).to be_a(GithubRepo)

        expect(repo.name).to be_a(String)
        expect(repo.url).to be_a(String)
        expect(repo.updated_at).to be_a(String)
        expect(repo.language).to be_a(String)
      end
    end
  end
end