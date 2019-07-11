module MembersHelper
    def admin?
        current_user.admin? || current_user == Member.find_by(id: params[:id])
    end

    def edit_member_link
        tag.a "edit", href: edit_member_path(@member), :class => "edit" if admin?
    end
end
