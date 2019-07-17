module MembersHelper
    def admin?
        logged_in? && current_user.admin? 
    end

    def member_privilege?
        current_user == Member.find_by(id: params[:id])
    end

    def edit_member_link
        # binding.pry
        tag.a "edit profile", href: edit_member_path(@member), :class => "edit" if admin? || member_privilege?
    end

    def view_member_link_or_text(member)
        if admin? || member_privilege?
            tag.a member.name, href: member_path(member)
        else
            member.name
        end
    end

    def view_chaired_link
        if admin? || Committee.chairs.include?(current_user)
            tag.a "view committees you chair", href: member_committees_path(current_user), :class => "edit"
        end
    end
end
