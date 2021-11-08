class MealsController < ApplicationController

    def index
        @meals = current_user.meals
    end
    
    def show
        @meal = current_user.meals.find(params[:id])
    end

    def new
        @meal = current_user.meals.new(date: Date.today)
        @meal.build_food
    end

    def create
        @meal = current_user.meals.new(meal_params)
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
            :meal, :date, food_attributes: [
                :name
            ]
        )
    end
end
