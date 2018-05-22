class MainController < ApplicationController
    def index
        # nothing yet
        if params[:movie] && !params[:movie].empty?
            search = TMDB::Search.new(params[:movie].to_s)
            @movies = search.results
        else
            @movies = []
        end
    end
end
