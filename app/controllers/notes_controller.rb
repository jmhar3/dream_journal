class NotesController < ApplicationController
    
    def show
        @note = Note.find(params[:id])
    end

    def new
        @note = Note.new(date: Date.today)
    end

    def create
        @note = Note.new(note_params)
        if @note.save
            redirect_to daily_path
        else
            render :new
        end
    end

    def edit
        @note = Note.find(note_params[:id])
    end

    def update
        @note = Note.find(note_params[:id])
        @note.update(note_params)
        
        redirect_to daily_path
    end

    private

    def note_params
        params.require(:note)
        .permit(:user_id, :content, :date)
        .with_defaults(user_id: session[:user_id])
    end
end
