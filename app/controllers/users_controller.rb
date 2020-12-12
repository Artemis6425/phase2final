class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'/user/index'
    end

    get '/signup' do
        @message = session[:message]
        session[:message] = nil
        erb :'/user/new'   #form posts to /create/user
    end

    post '/create/user' do
        puts params
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        if !@user.save
            session[:message] = "Didn't seem to work. Did you mistype, or maybe do you already have an account?"
            redirect to '/signup'
        else
            @user.save
            session[:message] = "Success! Please Login to Verify Your Information."
            redirect '/login'
        end
    end

    get '/login' do
        @message = session[:message]
        session[:message] = nil
        erb :'/user/login' #form posts to /users
    end

    post '/users' do    #I'M LOGGED IN
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/runs'
        else
            session[:message] = "Incorrect Email or Password"
            redirect '/users/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/user/show'
    end


end