class GithubRepo
  attr_reader :name,
              :description,
              :url,
              :updated_at,
              :language

  def initialize(attrs = {})
    @name       = attrs[:name]
    @desciption = attrs[:description]
    @url        = attrs[:html_url]
    @updated_at = attrs[:updated_at]
    @language   = attrs[:language]
  end

  def self.gather_repos(user)
    GithubService.request_repos(user).map do |raw_repo|
      new(raw_repo)
    end
  end

  def self.get_repo(repo_name, user)
    raw_repo = GithubService.get_repo(repo_name, user)
    new(raw_repo)
  end
end
