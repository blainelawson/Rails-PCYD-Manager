module CommitteesHelper
    def committee_chair(committee)
        if committee.chair
            committee.chair.name
        else
            "Position empty"
        end
    end

    def edit_committee_link(committee)
        if logged_in? && admin?
            tag.a "edit", href: edit_committee_path(committee), :class => "edit"
        end
    end

    def new_committee_link
        if params[:member_id]
            tag.a "Add committee", href: new_member_committee_path(current_user), :class => "edit"
        elsif admin?
            tag.a "Add Committee", href: new_committee_path, :class => "edit"
        end
    end

    def committee_link(committee)
        if admin? || current_user == committee.chair || Director.include?(current_user)
            tag.a committee.name, href: committee_path(committee)
        else
            committee.name
        end
    end

    def committee_star(committee)
        if current_user == committee.chair
            "*"
        end
    end

    def edit_committee_members_link(committee)
        if admin? || current_user == committee.chair
            # tag.a "edit", href: edit_committee_members
        end
    end
end
