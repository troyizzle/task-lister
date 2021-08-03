class Task::ListsController < ApplicationController
  before_action :set_task_list, only: %i[show edit update destroy archive]

  # GET /task/lists or /task/lists.json
  def index
    @task_lists = Task::List.all.active
  end

  # GET /task/lists/1 or /task/lists/1.json
  def show
    @task_items = @task_list.items.active
  end

  # GET /task/lists/new
  def new
    @task_list = Task::List.new
  end

  # GET /task/lists/1/edit
  def edit; end

  def archive
    @task_list.update(status: :archived)

    redirect_to task_lists_path
  end

  # POST /task/lists or /task/lists.json
  def create
    @task_list = Task::List.new(task_list_params)

    respond_to do |format|
      if @task_list.save
        format.html { redirect_to @task_list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @task_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js { render :new, status: :unprocessable_entity }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task/lists/1 or /task/lists/1.json
  def update
    respond_to do |format|
      if @task_list.update(task_list_params)
        format.html { redirect_to @task_list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task/lists/1 or /task/lists/1.json
  def destroy
    @task_list.destroy
    respond_to do |format|
      format.html { redirect_to task_lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task_list
    @task_list = Task::List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_list_params
    params.require(:task_list).permit(:status, :name)
  end
end
