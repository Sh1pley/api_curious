class GithubService

  def self.request_repos(login)
    response = Faraday.get("https://api.github.com/users/#{login}/repos?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.request_user(login)
    response = Faraday.get("https://api.github.com/users/#{login}?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_repo(repo_name, login)
    response = Faraday.get("https://api.github.com/repos/#{login}/#{repo_name}?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end