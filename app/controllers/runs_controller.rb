class RunsController < ApplicationController

    get '/runs' do
        @runs = Run.all
        erb :'run/index'
    end

    get '/runs/new' do
        erb :'run/new'
    end

    get '/runs/:id' do
        @run = Run.find(params[:id])
        @user = User.find_by_id(@run.user_id)
        erb :'run/show'
    end

    get '/runs/:id/edit' do
        @run = Run.find(params[:id])
        if @run.user_id == session.id           #something like that
            erb :'run/edit'
        else
            redirect '/runs'
        end
    end

end