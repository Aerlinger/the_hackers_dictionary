class DefinitionsController < ApplicationController

  before_filter :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /definitions
  # GET /definitions.json
  def index

    if params[:letter]
      @definitions = Definition.starts_with(params[:letter])
    else
      @definitions = Definition.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @definitions }
    end
  end

  # GET /definitions/1
  # GET /definitions/1.json
  def show
    @definition = Definition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @definition }
    end
  end

  # GET /definitions/new
  # GET /definitions/new.json
  def new
    @definition = Definition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @definition }
    end
  end

  # GET /definitions/1/edit
  def edit
    @definition = Definition.find(params[:id])
  end

  # POST /definitions
  # POST /definitions.json
  def create
    @definition = Definition.new(params[:definition])

    respond_to do |format|
      if @definition.save
        format.html { redirect_to @definition, notice: 'Definition was successfully created.' }
        format.json { render json: @definition, status: :created, location: @definition }
      else
        format.html { render action: "new" }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /definitions/1
  # PUT /definitions/1.json
  def update
    @definition = Definition.find(params[:id])

    respond_to do |format|
      if @definition.update_attributes(params[:definition])
        format.html { redirect_to @definition, notice: 'Definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /definitions/1
  # DELETE /definitions/1.json
  def destroy
    @definition = Definition.find(params[:id])
    @definition.destroy

    respond_to do |format|
      format.html { redirect_to definitions_url }
      format.json { head :no_content }
    end
  end

end
