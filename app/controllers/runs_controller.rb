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
        @run = Run.new(time: params["time"], date: params["date"], note: params["note"], user_id: params["user_id"])
        if !@run.save
            session[:message] = "Run wasn't added. Please try again!"
        else
            @run.save
            session[:message] = "Your run has been added to the board!"
        end
        redirect '/runs'
    end

    patch '/edit/run' do
        run = Run.find(params[:id])
        run.update(time: params["time"], date: params["date"], note: params["note"])
        session[:message] = "Run has been updated!"
        redirect "/users/#{session[:user_id]}"
    end

    delete '/delete/run'do
        run = Run.find(params[:id])
        run.destroy
        session[:message] = "Run deleted!"
        redirect "/users/#{session[:user_id]}"
    end

    get '/runs/:id' do
        @run = Run.find(params[:id])
        erb :'/run/show'
    end

    get '/runs/:id/edit' do
        @run = Run.find(params[:id])
        if @run.user.id == session[:user_id]          #something like that
            erb :'/run/edit'
        else
            session[:message] = "You don't have permission to edit this run."
            redirect "/users/#{@run.user.id}"
        end
    end

end