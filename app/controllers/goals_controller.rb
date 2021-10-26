class GoalsController < ApplicationController
    
    def show
        @goal = Goal.find(params[:id])
    end

    def new
        @goal = Goal.new(date: Date.today)
    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            redirect_to daily_path
        else
            render :new
        end
    end

    def edit
        @goal = Goal.find(params[:id])
    end

    def update
        @goal = Goal.find(params[:id])
        @goal.update(goal_params)
        
        redirect_to daily_path
    end

    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        redirect_to daily_path
    end

    private

    def goal_params
        params.require(:goal)
        .permit(:goal, :priority, :user_id, :content, :date)
        .with_defaults(user_id: session[:user_id], priority: false, date: Date.today)
    end
end