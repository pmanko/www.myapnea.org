class QuestionFlowsController < ApplicationController
  before_action :set_question_flow, only: [:show, :edit, :update, :destroy]

  # GET /question_flows
  # GET /question_flows.json
  def index
    @question_flows = QuestionFlow.all
  end

  # GET /question_flows/1
  # GET /question_flows/1.json
  def show
  end

  # GET /question_flows/new
  def new
    @question_flow = QuestionFlow.new
  end

  # GET /question_flows/1/edit
  def edit
  end

  # POST /question_flows
  # POST /question_flows.json
  def create
    @question_flow = QuestionFlow.new(question_flow_params)

    respond_to do |format|
      if @question_flow.save
        format.html { redirect_to @question_flow, notice: 'Question flow was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question_flow }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_flows/1
  # PATCH/PUT /question_flows/1.json
  def update
    respond_to do |format|
      if @question_flow.update(question_flow_params)
        format.html { redirect_to @question_flow, notice: 'Question flow was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @question_flow }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_flows/1
  # DELETE /question_flows/1.json
  def destroy
    @question_flow.destroy
    respond_to do |format|
      format.html { redirect_to question_flows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_flow
      @question_flow = QuestionFlow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_flow_params
      params.require(:question_flow).permit(:answer_option_id, :condition, :child_id)
    end
end
