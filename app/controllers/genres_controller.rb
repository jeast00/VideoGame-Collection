class GenresController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        if params[:game_id] && @game = Game.find(params[:game_id])
            @game = Game.find(params[:game_id])
            @genres = @game.genres
        else
            @genres = Genre.all 
        end
    end

    def new
        if params[:game_id] && @game = Game.find(params[:game_id])
            @genre = @game.genres.build
        else
            @genre = Genre.new
        end
    end

    def create
        @genre = @games.genres.build(genre_params)

        if @genre.save
            redirect_to genres_path
        else
            render :new
        end
    end

    def show
        @genre = Genre.find(params[:id])
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])

        if @genre.update(genre_params)
            redirect_to genres_path
        else
            render :edit
        end
    end

    def destroy
        @genre = Genre.find(params[:id])
        @genre.destroy
        redirect_to genres_path
    end

    private

    def genre_params
        params.require(:genre).permit(:genre_type, :user_id, :game_id)
    end
end
