class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'/users/index'
    end

    get '/users/new' do
        erb :'/users/new'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        @user_runs = Run.find_by_user_id(@user.id)
        erb :'/owners/show'
    end


end