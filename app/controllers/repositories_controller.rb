class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers['token'] = session[:token]
      req.response = 'application/json'
    end
    @repos = JSON.parse(resp.body)
  end

end
