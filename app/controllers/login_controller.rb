class LoginController < ApplicationController
  def index
    @user = User.new
  end

  def new
    return false unless request.post?
    
    # 1. Login to reddit
    login = RestClient.post("http://www.reddit.com/api/login", { :user => params[:username], :passwd => params[:password] })
    
    unless login.cookies.include?("reddit_session")
      redirect_to :action => 'index'
    end
    
    @user = User.find_or_create_by_username(:username => params[:username])
    @user.reddits = [] # If we're updating, clear all old reddits.
    
    # 2. Get list of reddits
    raw_reddits = RestClient.get('http://www.reddit.com/reddits/mine/.json', { :cookies => login.cookies })
    json_reddits = JSON.parse(raw_reddits)
    
    json_reddits["data"]["children"].each do |red|
      r = red["data"]
      
      # 3. WE HAVE 'DEMS REDDITS!
      # Get each one, linking it to this user & create it if it doesn't yet exist
      reddit = Reddit.find_or_create_by_uid({ :uid => r["id"], :name => r["title"], :url => r["url"] })
      @user.reddits << reddit
    end
    
    redirect_to :action => 'thanks', :user => params[:username] and return
  end

  def thanks
    @user = User.find_by_username(params[:user])
  end

end
