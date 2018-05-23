class FilmsController < ApplicationController
    before_action :set_film, only: [:destroy, :upvote, :downvote]

    def index
        @films = Film.all
    end

    #GET /films/:id
    def show
    end

    # GET /films/new
    def new
        # pretty sure we get use this empty model to create a form
        @film = Film.new
    end
    # POST /films
    def create
        @film = Film.new(film_params.merge(user_id: current_user.id))

        if @film.save
            # something
            redirect_to films_url, notice: 'Film was successfully created'
        else
            # something else
            redirect_to films_url, notice: 'Film could not be created'
        end
    end

    # DELETE /posts/:id
    def destroy
        @post.destroy
    end

    def upvote 
        @film.liked_by current_user
        redirect_back(fallback_location: root_path)
      end  
      
      def downvote
        @film.unliked_by current_user
        redirect_back(fallback_location: root_path)
      end
    
    private
    def film_params
        params.require(:film).permit(:title, :user_id, :director, :year)
    end

    def set_film
        @film = Film.find(params[:id])
    end
end
