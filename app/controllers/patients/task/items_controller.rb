class Patients::Task::ItemsController < ApplicationController
  before_action :set_patients_task_item, only: %i[show edit update destroy complete]

  # GET /patients/task/items or /patients/task/items.json
  def index
    @patients_task_items = Patients::Task::Item.all
  end

  # GET /patients/task/items/1 or /patients/task/items/1.json
  def show; end

  # GET /patients/task/items/new
  def new
    @patients_task_item = Patients::Task::Item.new
  end

  def complete
    @patients_task_item.update(completed_date: Time.now)
  end

  # GET /patients/task/items/1/edit
  def edit; end

  # POST /patients/task/items or /patients/task/items.json
  def create
    @patients_task_item = Patients::Task::Item.new(patients_task_item_params)

    respond_to do |format|
      if @patients_task_item.save
        format.html { redirect_to @patients_task_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @patients_task_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patients_task_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/task/items/1 or /patients/task/items/1.json
  def update
    respond_to do |format|
      if @patients_task_item.update(patients_task_item_params)
        format.html { redirect_to @patients_task_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @patients_task_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patients_task_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/task/items/1 or /patients/task/items/1.json
  def destroy
    @patients_task_item.destroy
    respond_to do |format|
      format.html { redirect_to patients_task_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patients_task_item
    @patients_task_item = Patients::Task::Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patients_task_item_params
    params.fetch(:patients_task_item, {})
  end
end
