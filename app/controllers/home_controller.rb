class HomeController < ApplicationController
  def index
    if current_user
      @user = UserDetail.get_details(current_user)
      @repos = GithubRepo.gather_repos(current_user).sort_by {|repo| repo.updated_at}.reverse.take(5)
      @followers = GithubFollow.get_followers(current_user)
      @following = GithubFollow.see_following(current_user)
    end
  end
end
