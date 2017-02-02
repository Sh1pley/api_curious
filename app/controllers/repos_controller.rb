class ReposController < ApplicationController

  def index
    if current_user
      @repos = GithubRepo.gather_repos(current_user)
    end
  end

  def show
    @repo = GithubRepo.get_repo(params[:id], params[:login])
  end

end
