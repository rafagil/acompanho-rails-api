class EntriesController < ApplicationController
    def index
        entries = Entry.where feed_id: params[:feed_id]
        if entries
            render :json => entries
        else
            render :status 404
        end
    end

    def show
        entry = Entry.find_by_id(params[:id])
        if entry
            render :json => entry
        else
            render :status 404
        end
    end
end
