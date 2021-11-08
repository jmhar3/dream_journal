class NotesController < ApplicationController
    
    def show
        @note = current_user.notes.find(params[:id])
    end

    def new
        @note = current_user.notes.new(date: Date.today)
    end

    def create
        @note = current_user.notes.new(note_params)
        if @note.save
            redirect_to session[:return]
        else
            render :new
        end
    end

    def edit
        @note = current_user.notes.find(params[:id])
    end

    def update
        @note = current_user.notes.find(params[:id])
        @note.update(note_params)
        
        redirect_to session[:return]
    end

    def destroy
        @note = current_user.notes.find(params[:id])
        @note.destroy
        redirect_to session[:return]
    end

    private

    def note_params
        params.require(:note)
        .permit(:user_id, :content, :date)
    end
end
