class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
    render :layout => false if (request.xhr?)
  end

  # GET /users/new
  def new
    @user = User.new
    render :layout => false if (request.xhr?)
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
    render :layout => false if (request.xhr?)
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render :action => :user_items, :layout => false if (request.xhr?)
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]

    if @user.save
      if request.xhr?
        render :json => {"error" => "false", "user" => @user}
      else
        redirect_to users_path, notice: 'User updated'
      end
    else
      if request.xhr?
        render :json => {"error" => "true", "errors" => @user.errors}
      else
        render action: 'edit'
      end
    end

  end

  # POST /users
  def create
    @user = User.new(params[:user])

    if @user.save
      if request.xhr?
        #render :json => {"error" => "false", "user" => @user, 'select_for_users' => (render :partial=>'blabla', :locals=>{'users'=>@users})}
        render :json => {"error" => "false", "user" => @user, }
      else
        redirect_to users_path, notice: 'User created successfully'
      end
    else
      if request.xhr?
        render :json => {"error" => "true", "errors" => @user.errors}
      else
        render action: 'new'
      end
    end
  end

  # DELETE /user/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if request.xhr?
      render :json => {"delete" => "true", "user_deleted" => @user}
    else
      redirect_to users_path, notice: 'User deleted'
    end
  end

end
