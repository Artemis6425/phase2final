class RunsController < ApplicationController

    get '/runs' do
        @message = session[:message]
        session[:message] = nil
        @runs = Run.all
        erb :'/run/index'
    end

    get '/runs/new' do
        erb :'/run/new'
    end

    post '/create/run' do
        @run = Run.create(time: params["time"], date: params["date"], note: params["note"], user_id: params["user_id"])
        redirect '/runs'
    end

    get '/runs/:id' do
        @run = Run.find(params[:id])
        erb :'/run/show'
    end

    get '/runs/:id/edit' do
        @run = Run.find(params[:id])
        if @run.user.id == session.user_id           #something like that
            erb :'/run/edit'
        else
            session[:message] = "You don't have permission to edit this run."
            redirect '/runs'
        end
    end

end