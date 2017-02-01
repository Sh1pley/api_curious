class User < ApplicationRecord

  def self.register(auth)
    User.find_or_create_by(uid: auth["uid"]) do |user|
      user.username = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      user.avatar = auth["info"]["image"]
      user.login = auth["extra"]["raw_info"]["login"]
    end
  end
end
