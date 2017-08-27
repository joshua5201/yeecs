class LabProgramsController < ApplicationController
  def index
    @schools = LabProgram.all
    @article = Page.find_by(url: '/lab_programs')
  end
end
