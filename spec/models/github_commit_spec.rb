require 'rails_helper'

describe 'GithubCommit' do
  let!(:user) { create(:user, login: "Sh1pley", token: ENV['token_id'])}
  context '.get_commits(login)' do
    it 'gets from github services' do
      VCR.use_cassette("github_get_commits") do
        results = GithubCommit.get_commits("99_bottles", user)

        expect(results).to be_a(Array)
        commit = results.first

        expect(commit.author).to be_a(Hash)
        expect(commit.committer).to be_a(Hash)
        expect(commit.message).to be_a(String)
        expect(commit.comment_count).to be_a(Integer)
      end
    end
  end

end