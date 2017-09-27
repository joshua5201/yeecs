require "administrate/base_dashboard"

class MemberDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    member_category: Field::BelongsTo,
    member_department: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    en_name: Field::String,
    title: Field::String,
    en_title: Field::String,
    full_title: Field::String,
    en_full_title: Field::String,
    content: CkEditorField,
    en_content: CkEditorField,
    rank: Field::Number,
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
    :member_category,
    :member_department,
    :id,
    :name,
    :title,
    :rank,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :member_category,
    :member_department,
    :id,
    :name,
    :en_name,
    :title,
    :en_title,
    :full_title,
    :en_full_title,
    :content,
    :en_content,
    :image,
    :rank,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :member_category,
    :member_department,
    :name,
    :en_name,
    :title,
    :en_title,
    :full_title,
    :en_full_title,
    :content,
    :en_content,
    :image,
    :rank,
  ].freeze

  # Overwrite this method to customize how members are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(member)
    if member.member_category
      "Member ##{member.id} (#{member.member_category.title}/#{member.name})"
    else
      "Member ##{member.id} (無分類/#{member.name})"
    end
  end
end
