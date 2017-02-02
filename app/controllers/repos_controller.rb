class ReposController < ApplicationController

  def index
    if current_user
      @repos = GithubRepo.gather_repos(current_user)
    end
  end

  def show
    @repo = GithubRepo.get_repo(params[:id], current_user)
    @commits = GithubCommit.get_commits(@repo.name, current_user)
  end

end
