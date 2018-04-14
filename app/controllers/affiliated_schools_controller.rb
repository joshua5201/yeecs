class AffiliatedSchoolsController < ApplicationController
  def index
    @schools = AffiliatedSchool.all.order(rank: :asc)
  end
end
