class Task::ItemsController < ApplicationController
  before_action :set_task_item, only: %i[show edit update destroy archive]
  before_action :set_task_list, only: %i[new]

  # GET /task/items or /task/items.json
  def index
    @task_items = Task::Item.all
  end

  # GET /task/items/1 or /task/items/1.json
  def show; end

  # GET /task/items/new
  def new
    @task_item = Task::Item.new(list: @task_list)
  end

  # GET /task/items/1/edit
  def edit; end

  def archive
    @task_item.update(status: :archived)

    redirect_to task_list_path(@task_item.list)
  end

  # POST /task/items or /task/items.json
  def create
    @task_item = Task::Item.new(task_item_params)

    respond_to do |format|
      if @task_item.save
        format.html { redirect_to task_list_path(@task_item.list), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @task_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js { render :new, status: :unprocessable_entity }
        format.json { render json: @task_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task/items/1 or /task/items/1.json
  def update
    respond_to do |format|
      if @task_item.update(task_item_params)
        format.html { redirect_to task_list_path(@task_item.list), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task/items/1 or /task/items/1.json
  def destroy
    @task_item.destroy
    respond_to do |format|
      format.html { redirect_to task_list_path(@task_item.list), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task_item
    @task_item = Task::Item.find(params[:id])
  end

  def set_task_list
    @task_list = Task::List.find(params[:list_id])
  end

  # Only allow a list of trusted parameters through.
  def task_item_params
    params.require(:task_item).permit(:title, :body, :due, :status, :list_id)
  end
end
