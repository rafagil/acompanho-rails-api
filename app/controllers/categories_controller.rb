class CategoriesController < ApplicationController
    def index
        render :json => Category.includes(:feeds).to_json(:except => [:created_at, :updated_at], :include => {:feeds => { :except => [:created_at, :updated_at]}})
    end

    def show
        category = Category.find_by_id(params[:id])
        if category
            render :json => category
        else
            render :status => 404
        end
    end

    def create
        category = Category.new(JSON.parse(request.body.read))
        category.save()
        render :json => category
    end

    def update
        category = Category.find_by_id(params[:id])
        if (category)
            category.assign_attributes(JSON.parse(request.body.read))
            category.save()
            render :json => category
        else
            render :status => 404
        end
    end
end