class GenresController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @genres = Genre.genre_with_most_games
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)

        if @genre.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    private

    def genre_params
        params.require(:genre).permit(:genre_type)
    end

end
