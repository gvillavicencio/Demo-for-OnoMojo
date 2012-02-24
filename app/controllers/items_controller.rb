class ItemsController < ApplicationController

  # GET /items
  def index
    @items = Item.find(:all, :include => :user)
    @users_count = User.count
    render :action => :index, :layout => false if (request.xhr?)
  end

  # GET /items/new
  def new
    @Item = Item.new
    @users = User.all
    render :action => :new, :layout => false if (request.xhr?)
  end

  # GET /items/:id/edit
  def edit
    @Item = Item.find(params[:id])
    @users = User.all
    render :action => :edit, :layout => false if (request.xhr?)
  end
  
  # POST /items
  def create
    @Item = Item.new(params[:item])

    respond_to do |format|
      if @Item.save
        format.html{redirect_to items_path, notice: 'Item created successfully'}
      else
        @users = User.all
        format.html{render action: 'new'}
      end
      format.js
    end
  end

  # PUT /items/:id
  def update
    @Item = Item.find(params[:id])
    @Item.attributes = params[:item]
    
    respond_to do |format|
      if @Item.save
        format.html{ redirect_to items_path, notice: 'Item updated'}
      else
        @users = User.all
        format.html{ render action: 'edit'} 
      end
      format.js
    end
  end

  # DELETE /Item/:id
  def destroy
    @Item = Item.find(params[:id])
    @Item.destroy

    respond_to do |format|
      format.html {redirect_to items_path, notice: 'Item deleted'}
      format.js
    end
  end

end
