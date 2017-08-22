require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    post_category: Field::BelongsTo,
    title: Field::String,
    en_title: Field::String,
    subtitle: Field::String,
    tag: Field::String,
    content: CkEditorField,
    en_content: CkEditorField,
    hidden: Field::Boolean,
    url: Field::String,
    image: ImageField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :post_category,
    :title,
    :hidden,
    :en_title,
    :subtitle,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :post_category,
    :title,
    :en_title,
    :subtitle,
    :tag,
    :content,
    :en_content,
    :hidden,
    :url,
    :image,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :en_title,
    :subtitle,
    :tag,
    :post_category,
    :content,
    :en_content,
    :hidden,
    :url,
    :image,
  ].freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(post)
    "公告##{post.id} #{post.title}"
  end
end
