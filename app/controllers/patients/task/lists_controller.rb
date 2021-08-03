class Patients::Task::ListsController < ApplicationController
  before_action :set_patients_task_list, only: %i[show edit update destroy]
  before_action :set_patient, only: %i[new]

  # GET /patients/task/lists or /patients/task/lists.json
  def index
    @patients_task_lists = Patients::Task::List.all
  end

  # GET /patients/task/lists/1 or /patients/task/lists/1.json
  def show; end

  # GET /patients/task/lists/new
  def new
    @patients_task_list = Patients::Task::List.new(patient: @patient, list_id: params['list_id'])
  end

  # GET /patients/task/lists/1/edit
  def edit; end

  # POST /patients/task/lists or /patients/task/lists.json
  def create
    @patients_task_list = Patients::Task::List.new(patients_task_list_params)

    respond_to do |format|
      if @patients_task_list.save!
        format.html { redirect_to patient_path(@patients_task_list.patient), notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @patients_task_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patients_task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/task/lists/1 or /patients/task/lists/1.json
  def update
    respond_to do |format|
      if @patients_task_list.update(patients_task_list_params)
        format.html { redirect_to @patients_task_list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @patients_task_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patients_task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/task/lists/1 or /patients/task/lists/1.json
  def destroy
    @patients_task_list.destroy
    respond_to do |format|
      format.html { redirect_to patients_task_lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_patients_task_list
    @patients_task_list = Patients::Task::List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patients_task_list_params
    params.require(:patients_task_list).permit(:patient_id,
                                               :list_id,
                                               :start_date,
                                               { items_attributes: [:item_id] })
  end
end
