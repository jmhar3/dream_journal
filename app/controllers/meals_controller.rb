class MealsController < ApplicationController
    def new
        @meal = Meal.new(date: Date.today)
    end

    def create
        @meal = Meal.new(meal_params)
        if @meal.save
            redirect_to daily_path
        else
            render :new
        end
    end

    private

    def meal_params
        params.require(:meal)
        .permit(:user_id, :type, :food, :date)
        .with_defaults(user_id: session[:user_id])
    end
end
