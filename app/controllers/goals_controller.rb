class GoalsController < ApplicationController
    before_action :set_goal, except: [:new, :create, :complete]
    
    def show
    end

    def new
        @goal = current_user.goals.new(date: Date.today)
    end

    def create
        @goal = current_user.goals.new(goal_params)
        if @goal.save
            redirect_to session[:return]
        else
            render :new
        end
    end

    def edit
    end

    def update
        @goal.update(goal_params)
        
        redirect_to session[:return]
    end

    def destroy
        @goal.destroy
        redirect_to session[:return]
    end

    def complete
        @goal = current_user.goals.find(params[:goal_id])
        @goal.update_attribute(:completed, !@goal[:completed])
        redirect_to daily_path
    end

    private

    def set_goal
        @goal = current_user.goals.find(params[:id])
    end

    def goal_params
        params.require(:goal)
        .permit(:goal, :priority, :user_id, :more_info, :date, :completed)
        .with_defaults(user_id: session[:user_id], priority: false, date: Date.today, completed: false)
    end
end