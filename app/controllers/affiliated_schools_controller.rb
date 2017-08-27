class AffiliatedSchoolsController < ApplicationController
  def index
    @schools = AffiliatedSchool.all
  end
end
