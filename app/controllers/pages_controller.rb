class PagesController < ApplicationController
  
def home
  def home
  redirect_to recipes_path if logged_in?
  end
end
  
end