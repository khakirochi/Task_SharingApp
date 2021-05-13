class HomeController < ApplicationController
  def top
    @room = Room.new
  end
end
