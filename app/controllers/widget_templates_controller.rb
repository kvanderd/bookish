class WidgetTemplatesController < ApplicationController
  def new
      @widget_template = WidgetTemplate.new()
  end

  def destroy

   @widget_template = WidgetTemplate.find(params[:id])
   @widget_template.destroy
   redirect_to action: "index"
  end

  def edit
    @widget_template = WidgetTemplate.find(params[:id])
  end

  def show
    @widget_template = WidgetTemplate.find(params[:id])
  end

  def index
  	@widget_templates = WidgetTemplate.all
  end

  def create
  	@widget_template = WidgetTemplate.new
  	@widget_template.name = params[:widget_template][:name]
    @widget_template.classtype = params[:widget_template][:classtype]
  	@widget_template.save
  	redirect_to action: "index"

  end

  # PATCH/PUT /widget_templateies/1
  # PATCH/PUT /instruction_factories/1.json
  def update
    @widget_template = WidgetTemplate.find(params[:id]) 
    @widget_template.classtype = params[:widget_template][:classtype]
    @widget_template.name = params[:widget_template][:name]
    respond_to do |format|
      
      if @widget_template.save
        format.html { redirect_to @widget_template, notice: 'widget_template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @widget_template.errors, status: :unprocessable_entity }
      end
    end
  end








end
