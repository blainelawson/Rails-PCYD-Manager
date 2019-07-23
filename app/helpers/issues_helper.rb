module IssuesHelper
    def find_ages_16_to_26
        link_to "Under 26", {:controller => "issues", :action => "index", :young => true}
    end

    def find_ages_27_to_40
        link_to "Over 26", {:controller => "issues", :action => "index", :old => true}
    end

    def all_issues
        link_to "All Issues", {:controller => "issues", :action => "index", :all => true }
    end
end
