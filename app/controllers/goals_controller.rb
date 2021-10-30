class GoalsController < ApplicationController
    before_action :set_goal, except: [:new, :create, :complete]
    
    def show
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
    end

    def update
        @goal.update(goal_params)
        
        redirect_to daily_path
    end

    def destroy
        @goal.destroy
        redirect_to daily_path
    end

    def complete
        @goal = Goal.find(params[:goal_id])
        @goal.update_attribute(:completed, !@goal[:completed])
        redirect_to daily_path
    end

    private

    def set_goal
        @goal = Goal.find(params[:id])
    end

    def goal_params
        params.require(:goal)
        .permit(:goal, :priority, :user_id, :more_info, :date, :completed)
        .with_defaults(user_id: session[:user_id], priority: false, date: Date.today, completed: false)
    end
end