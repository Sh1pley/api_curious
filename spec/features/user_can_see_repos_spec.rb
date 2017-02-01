require 'rails_helper'

describe "User can see repos" do
  before do
    VCR.use_cassette('github/user_repo') do
      @user_repos = Faraday.get("https://api.github.com/users/Sh1pley/repos")
    end
  end
  it "current user" do
    visit '/'
    click_on 'Log in with Github'
    expect(current_path).to eq('/')
    
    end
  end
end