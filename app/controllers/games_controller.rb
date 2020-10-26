class GamesController < ApplicationController

    before_action  :redirect_if_not_logged_in

    def index
        if params[:user_id] && @user = User.find(params[:user_id])
            @games = @user.games
        else
            @games = Game.all
        end
    end

    def new
        if params[:user_id] && @user = User.find(params[:user_id])
            @game = @user.games.build
        else
            @game = Game.new
        end
    end

    def show
        @game = Game.find(params[:id])
        redirect_to user_game_path(@user, @game) if !@game
    end

    def create
        @game = current_user.games.build(game_params)

        if @game.save
            redirect_to games_path
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
            redirect_to user_game_path(@user, @game)
        else
            render :edit
        end
    end

    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        redirect_to user_games_path(@user)
    end

    private

    def game_params
        params.require(:game).permit(:title, :platform, :user_id)
    end

end
