class GithubService

  def self.request_repos(login)
    response = Faraday.get("https://api.github.com/users/#{login}/repos")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.request_user(login)
    response = Faraday.get("https://api.github.com/users/#{login}")
    JSON.parse(response.body, symbolize_names: true)
  end
end