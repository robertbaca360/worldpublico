class HomeController < ApplicationController
  layout :add_layout

  def index
  end

  def test
  end

  private
  def add_layout
    action_name == "index" ? "home" : "application"
  end
end
