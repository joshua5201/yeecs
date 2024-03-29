require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
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
    subtitle: Field::String,
    content: CkEditorField,
    en_content: CkEditorField,
    url: Field::String,
    image: ImageField,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    is_pure_link: Field::Boolean,
    en_title: Field::String,
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
    :subtitle,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :category,
    :id,
    :title,
    :subtitle,
    :content,
    :en_content,
    :url,
    :image,
    :type,
    :created_at,
    :updated_at,
    :is_pure_link,
    :en_title,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :title,
    :subtitle,
    :content,
    :en_content,
    :url,
    :image,
    :type,
    :is_pure_link,
    :en_title,
  ].freeze

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(article)
    "##{article.id}: #{article.title}"
  end
end
