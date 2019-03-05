class CollaborationsController < ApplicationController

  def new
    collaboration = Collaboration.new
    
    render :new
  end

  def create

  end

end
