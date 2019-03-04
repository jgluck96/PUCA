class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def method
    #code
  end
end
