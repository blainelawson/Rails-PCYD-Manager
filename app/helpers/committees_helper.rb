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

end
