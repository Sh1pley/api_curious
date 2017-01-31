describe 'dashboard index path' do
  it 'welcomes the logged in user' do
    visit dashboard_index_path

    expect(page).to have_content("Welcome")
  end
end