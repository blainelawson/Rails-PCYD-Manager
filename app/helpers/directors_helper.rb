module DirectorsHelper
    def director_name(director)
        director.chair ? director.chair.name : "Position empty"
    end

    def add_director_link
        tag.a "Add director", href: new_director_path, :class => "edit" if admin?
    end

    def edit_director_link(director)
        tag.a "edit", href: edit_director_path(director), :class => "edit" if admin?
    end
end
