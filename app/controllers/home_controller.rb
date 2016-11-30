class HomeController < ApplicationController
  layout :add_layout
  # layout 'home', only: :index

  def index
  end

  def test
    
  end

  private
  def add_layout
    action_name == "index" ? "home" : "application"
  end
end
