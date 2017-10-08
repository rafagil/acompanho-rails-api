class FeedsController < ApplicationController
    def index
        feeds = Feed.where category_id: params[:category_id]
        if feeds
            render :json => feeds
        else 
            render :status => 404
        end
    end

    def create
        feed = Feed.new(JSON.parse(request.body.read))
        feed.category_id = params[:category_id]
        feed.save()
        render :json => feed
    end
end
