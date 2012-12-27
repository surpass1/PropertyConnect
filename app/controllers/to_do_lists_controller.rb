class ToDoListsController < ApplicationController
  load_and_authorize_resource
  # GET /to_do_lists
  # GET /to_do_lists.json
  def index
  end

  # GET /to_do_lists/1
  # GET /to_do_lists/1.json
  def show
  end

  # GET /to_do_lists/new
  # GET /to_do_lists/new.json
  def new
  end

  # GET /to_do_lists/1/edit
  def edit
  end

  # POST /to_do_lists
  # POST /to_do_lists.json
  def create
    @to_do_list.user_id = current_user.id
    @to_do_list.save
    redirect_to @to_do_list
  end

  # PUT /to_do_lists/1
  # PUT /to_do_lists/1.json
  def update
    @to_do_list.update_attributes(params[:to_do_list])
    redirect_to @to_do_list
  end

  # DELETE /to_do_lists/1
  # DELETE /to_do_lists/1.json
  def destroy
    redirect_to to_do_lists_path
  end
end
