require "administrate/base_dashboard"

class PageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    en_title: Field::String,
    subtitle: Field::String,
    rank: Field::Number,
    content: CkEditorField,
    en_content: CkEditorField,
    hidden: Field::Boolean,
    en_hidden: Field::Boolean,
    url: Field::String,
    image: ImageField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    is_pure_link: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :category,
    :id,
    :title,
    :hidden,
    :en_hidden,
    :en_title,
    :rank,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :category,
    :id,
    :title,
    :en_title,
    :subtitle,
    :content,
    :en_content,
    :hidden,
    :en_hidden,
    :rank,
    :url,
    :image,
    :created_at,
    :updated_at,
    :is_pure_link,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :title,
    :subtitle,
    :en_title,
    :content,
    :en_content,
    :hidden,
    :en_hidden,
    :rank,
    :url,
    :image,
    :is_pure_link,
  ].freeze

  # Overwrite this method to customize how pages are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(page)
    if page.category.present?
      "Page ##{page.id} (#{page.category.title}/#{page.title})"
    else
      "Page ##{page.id} (#{page.title})"
    end
  end
end
