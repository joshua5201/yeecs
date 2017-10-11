module MemberCategoriesHelper
  def render_members(members)
    if have_department(members)
      departments = MemberDepartment.where(id: members.map(&:member_department_id))
      render(partial: 'member_categories/departments', locals: {departments: departments})
    else
      render(partial: 'member_categories/members', locals: {members: members})
    end
  end

  private

  def have_department(members)
    members.select {|m|
      m.member_department_id.present?
    }.present?
  end
end
