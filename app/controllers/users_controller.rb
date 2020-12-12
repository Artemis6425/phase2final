class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'/users/index'
    end

    get '/users/new' do
        erb :'/users/new'   #form posts to /users/new
    end

    post '/users/new' do
        puts params
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        @user.save
        session[:user_id] = @user.id
        redirect '/users'
    end

    get '/login' do
        erb :'/users/login' #form posts to /users
    end

    post '/users' do    #I'M LOGGED IN
        @user = User.find_by(email: params[:email], password: params[:password])
        if @user
            session[:user_id] = @user.id
            redirect '/users/:id'
        end
        redirect '/users/login'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        @user_runs = Run.find_by_user_id(@user.id)
        erb :'/owners/show'
    end


end