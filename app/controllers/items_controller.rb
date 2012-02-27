class ItemsController < ApplicationController

  # GET /items
  def index
    @items = Item.find(:all, :include => :user)
    @users_count = User.count
    render :layout => false if (request.xhr?)
  end

  # GET /items/new
  def new
    @Item = Item.new
    @users = User.all
    render :layout => false if (request.xhr?)
  end

  # GET /items/:id/edit
  def edit
    @Item = Item.find(params[:id])
    @users = User.all
    render :layout => false if (request.xhr?)
  end
  
  # POST /items
  def create
    @Item = Item.new(params[:item])


    if @Item.save
      if request.xhr?
        render :json => {"error" => "false", "item" => @Item, }
      else
        redirect_to items_path, notice: 'Item created successfully'
      end
    else
      if request.xhr?
        render :json => {"error" => "true", "errors" => @Item.errors}
      else
        @users = User.all
        render action: 'new'
      end
    end
     
   
  end

  # PUT /items/:id
  def update
    @Item = Item.find(params[:id])
    @Item.attributes = params[:item]
    

    if @Item.save
      if request.xhr?
        render :json => {"error" => "false", "item" => @Item, }
      else
        redirect_to items_path, notice: 'Item updated'
      end
    else
      if request.xhr?
        render :json => {"error" => "true", "errors" => @Item.errors}
      else
        @users = User.all
        render action: 'edit'
      end
    end
  end

  # DELETE /Item/:id
  def destroy
    @Item = Item.find(params[:id])
    @Item.destroy

    if request.xhr?
      render :json => {"delete" => "true", "item_deleted" => @Item}
    else
      redirect_to items_path, notice: 'Item deleted'
    end
  end

end
