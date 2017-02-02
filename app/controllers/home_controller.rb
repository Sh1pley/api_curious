class HomeController < ApplicationController
  def index
    if current_user
      @user = UserDetail.get_details(current_user)
      @repos = GithubRepo.gather_repos(current_user).sort_by {|repo| repo.updated_at}.reverse.take(5)
    end
  end
end
