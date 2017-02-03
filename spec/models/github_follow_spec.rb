require 'rails_helper'

describe 'GithubFollow' do
  let!(:user) { create(:user, token: ENV['token_id'])}
  context '.get_followers(login)' do
    it 'gets followers from github services' do
      VCR.use_cassette("github_get_followers") do
        results = GithubFollow.get_followers(user)

        expect(results).to be_a(Array)
        follower = results.first

        expect(follower).to be_a(GithubFollow)
        expect(follower.login).to be_a(String)
        expect(follower.url).to be_a(String)
        expect(follower.avatar).to be_a(String)
      end
    end
  end
  context '.see_following(login)' do
    it 'shows who they are following' do
      VCR.use_cassette("github_see_following") do
        results = GithubFollow.see_following(user)

        expect(results).to be_a(Array)
        following = results.first

        expect(following).to be_a(GithubFollow)
        expect(following.login).to be_a(String)
        expect(following.url).to be_a(String)
        expect(following.avatar).to be_a(String)
      end
    end
  end
end