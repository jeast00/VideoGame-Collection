class GamesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
            if params[:genre_id] && @genre = Genre.find_by_id(params[:genre_id])
                @games = @genre.games
            else
                @error = "This game does not exist" if params[:genre_id]
                @games = Game.all
            end
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @game = @genre.games.build
        else
            @game = Game.new
        end
    end

    def show
        @game = Game.find(params[:id])
    end

    def create
        @game = current_user.games.build(game_params)

        if @game.save
            redirect_to @game
        else
            render :new
        end
    end

    def edit
        @game = Game.find(params[:id])
    end

    def update
        @game = Game.find(params[:id])

        if @game.update(game_params)
            redirect_to games_path
        else
            render :edit
        end
    end

    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        redirect_to games_path
    end

    private

    def game_params
        params.require(:game).permit(:title, :platform, :user_id, :genre_id)
    end

end
