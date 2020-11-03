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
        @game = current_user.games.build(game_params)

        if @game.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def edit
        @game = Game.find_by_id(params[:id])
    end

    def update
        @game = Game.find_by_id(params[:id])
        
        if @game.update(game_params)
            redirect_to user_game_path(current_user.id, @game)
        else
            render :edit
        end
    end



    private

    def game_params
        params.require(:game).permit(:title, :platform, :genre_id, :user_id)
    end

end
