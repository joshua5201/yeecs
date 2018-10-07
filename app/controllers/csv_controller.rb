require "csv"
class CsvController < ApplicationController
  before_action :authenticate_admin
  BOM = "\uFEFF".freeze
  def show
    if params[:grade]
      users = User.where(grade: params[:grade])
    else
      users = User.all
    end
    request.format = :csv
    attributes = %w{grade name mobile email telephone zipcode address company_name job company_phone company_email master master_instructor phd phd_instructor current_location note}
    data = CSV.generate do |csv|
      csv << (attributes.map {|attr| I18n.t("helpers.label.user.#{attr}") })
      users.each {|user| 
        csv << attributes.map {|attr| user.send(attr) } 
      }
    end
    send_data BOM + data, filename: "eecs-alumni-#{params[:grade] ? params[:grade] : "all"}-#{Time.zone.today.iso8601}.csv"
    respond_to do |format|
      format.csv
    end
  end
end
