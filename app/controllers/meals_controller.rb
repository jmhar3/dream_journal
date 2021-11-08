class MealsController < ApplicationController

    def index
        @meals = current_user.meals
    end
    
    def show
        @meal = current_user.meals.find(params[:id])
    end

    def new
        @meal = current_user.meals.new(date: Date.today)
        @meal.food = @meal.build_food
    end

    def create
        @meal = current_user.meals.new(meal_params)
        if @meal.save
            redirect_to session[:return]
        else
            render :new
        end
    end

    private

    def meal_params
        params.require(:meal)
        .permit(
            :date, :meal_type, food_attributes: [
                :name, :user_id
            ]
        ).with_defaults(user_id: session[:user_id])
    end
end