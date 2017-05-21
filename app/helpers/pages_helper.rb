module PagesHelper
  def page_link(page)
    if page.is_pure_link
      return page.url
    end

    if page.url.present?
      return '/pages/' + page.url
    end

    return Rails.application.routes.url_helpers.page_path(page) 
  end
end
