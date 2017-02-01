describe 'User' do
  before :each do
    @user =  {"uid" => "1234",
              "info" => {"name" => "Testy",
                         "image" => "test_image.jpeg"},
              "credentials" => {"token" => "abcde12345"},
              "extra" => {"raw_info" => {"login" => "Sh1pley"}}
            }
  end

  it 'can be registered with uid' do
    result = User.register(@user)

    expect(result.uid).to eq(@user["uid"])
  end

  it 'can be created with username' do
    result = User.register(@user)

    expect(result.username).to eq(@user["info"]["name"])
  end

  it 'can be registered with token' do
    result = User.register(@user)

    expect(result.token).to eq(@user["credentials"]["token"])
  end

  it 'can be registered with avatar' do
    result = User.register(@user)

    expect(result.avatar).to eq(@user["info"]["image"])
  end

  it 'will register or find existing user by :uid' do
    test = User.register(@user)
    result = User.register(@user)
    users = User.all

    expect(result.uid).to eq(test.uid)
    expect(result.id).to eq(test.id)
    expect(users.count).to eq(1)
  end
end