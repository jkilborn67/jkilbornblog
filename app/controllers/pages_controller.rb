class PagesController < ApplicationController
  
  def home
    # dont show the home page if the user is logged in, show the articles
    redirect_to articles_path if logged_in?
  end
  
  
end