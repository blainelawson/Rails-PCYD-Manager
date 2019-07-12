module DirectorsHelper
    def director_name(director)
        director.chair ? director.chair.name : "Position empty"
    end
end
