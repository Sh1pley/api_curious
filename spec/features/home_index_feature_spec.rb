require 'rails_helper'

describe 'root path' do
  let!(:user) {create(:user)}

  it 'asks user to log in' do
    visit root_path

    expect(current_path).to eq('/')
    expect(page).to_not have_selector(".welcome")
  end

  it 'welcomes logged in user' do
    VCR.use_cassette("logged_in_user") do
      page.set_rack_session(:user_id => user.id)
      visit root_path

      expect(page).to have_selector(".welcome")
      expect(page).to have_content("#{user.username}")
    end
  end

  it 'can logout to the root path' do
    VCR.use_cassette("logged_out_user") do
      page.set_rack_session(:user_id => user.id)
      visit root_path
      click_on("Logout")

      expect(current_path).to eq('/')
    end
  end

end