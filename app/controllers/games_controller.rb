class GamesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
            @games = Game.all
    end

    def new
            @game = Game.new
    end

    def show
        @game = Game.find(params[:id])
    end

    def create
        @game = current_user.games.build(game_params)

        if @game.save
            redirect_to game_genre_path(@game)
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
            redirect_to game_genre_path(@game)
        else
            render :edit
        end
    end

    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        redirect_to game_genre_path(@game)
    end

    private

    def game_params
        params.require(:game).permit(:title, :platform, :user_id)
    end

end
