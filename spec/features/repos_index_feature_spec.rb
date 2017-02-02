require 'rails_helper'

describe 'repos path' do
  let!(:user) {create(:user, login: "Sh1pley", token: "d2aa7244db825ceba114450f449b6500d92f2950")}

  it 'shows a user a list of their repos' do
    VCR.use_cassette("user_repos_index") do
      page.set_rack_session(:user_id => user.id)
      visit repos_path

      expect(current_path).to eq('/repos')
      expect(page).to have_selector("section.repo", count: 25)
    end
  end

  it 'has links to each repo' do
    VCR.use_cassette("user_repos_index") do
      page.set_rack_session(:user_id => user.id)
      visit repos_path
      expect(page).to have_selector("span.repo", count: 25)

      expect(page).to have_content("99_bottles")
    end
  end

end