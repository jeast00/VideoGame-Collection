class GamesController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :find_game #use private method for finding game as a before action call

    def new
        @game = Game.new(user_id: params[current_user.id])
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @games = @user.games
        else
            @games = Game.all 
        end
    end

    def show
        @user = User.find_by_id(params[:user_id])
    end

    def create
        @game = current_user.games.build(game_params)

        if @game.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def update
        if @game.update(game_params)
            redirect_to user_game_path(current_user.id, @game)
        else
            render :edit
        end
    end

    def destroy
        @game.destroy
        redirect_to user_games_path(current_user.id)
    end

    private

    def find_game
        @game = Game.find_by_id(params[:id]) #refactor and DRY up find_by_id into one method
    end

    def game_params
        params.require(:game).permit(:title, :platform, :genre_id, :user_id)
    end

end
