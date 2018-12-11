class TopPagesController < ApplicationController
  def home
    if logged_in?
      @player = current_player
      @team = @player.team
      redirect_to root_url and return unless @player.activated?
    end
  end
  
  def contact
  end
end
