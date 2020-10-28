class GenresController < ApplicationController

    # before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @genres = @user.genres
        else
            @genres = Genre.all 
        end
    end

    def new
        @genre = Genre.new(user_id: params[:user_id])
    end

    def create
        byebug
        @genre = Genre.new(genre_params)

        if @genre.save
            redirect_to genres_path
        else
            render :new
        end
    end

    def show
        @genre = Genre.find_by_id(params[:id])
    end

    def edit
        @genre = Genre.find_by_id(params[:id])
    end

    def update
        @genre = Genre.find_by_id(params[:id])

        if @genre.update(genre_params)
            redirect_to genres_path
        else
            render :edit
        end
    end

    def destroy
        @genre = Genre.find_by_id(params[:id])
        @genre.destroy
        redirect_to genres_path
    end

    private

    def genre_params
        params.require(:genre).permit(:genre_type, :user_id, :game_id)
    end
end
