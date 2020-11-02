class GamesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        @games = Game.all 
    end

    def new
        @game = Game.new(user_id: params[:user_id])
    end

    def show
        @game = Game.find_by_id(params[:id])
    end

    def create
        byebug
        @game = current_user.games.build(game_params)

        if @game.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end


    private

    def game_params
        params.require(:game).permit(:title, :platform, :genre_id, :user_id)
    end

end
