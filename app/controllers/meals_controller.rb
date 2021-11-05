class MealsController < ApplicationController

    def index
        @meals = Meal.where(user_id: session[:user_id])
    end
    
    def show
        @meal = Meal.find(params[:id])
    end

    def new
        @meal = Meal.new(date: Date.today)
        @meal.build_food(user_id: session[:user_id])
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
        .permit(
            :user_id, :meal, :date, food_attributes: [
                :name, :user_id
            ]
        )
        .with_defaults(user_id: session[:user_id])
    end
end
