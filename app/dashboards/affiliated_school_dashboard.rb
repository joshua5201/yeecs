require "administrate/base_dashboard"

class AffiliatedSchoolDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    rank: Field::Number,
    title: Field::String,
    en_title: Field::String,
    url: Field::String,
    img: ImageField,
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
    :title,
    :en_title,
    :url,
    :rank,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :en_title,
    :url,
    :img,
    :rank,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :en_title,
    :rank,
    :url,
    :img,
  ].freeze

  # Overwrite this method to customize how affiliated schools are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(affiliated_school)
  #   "AffiliatedSchool ##{affiliated_school.id}"
  # end
end
