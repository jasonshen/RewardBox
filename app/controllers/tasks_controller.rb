class TasksController < ApplicationController

    before_filter :require_login, except: [:index]

  def new
    @task = current_user.tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  def create
    @task = current_user.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(tasks_params)
        format.html { redirect_to @task, notice: 'task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  def edit
    @task = current_user.tasks.find(params[:id])
  end



  def index
    if user_signed_in?
      @tasks = current_user.tasks.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tasks }
      end
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  private

  def require_login
    unless  user_signed_in?
      flash[:error] = "You must be logged in do that. Sorry! Luckily logging in / signing up takes just a sec! =)"
      redirect_to new_user_session_path
    end
  end

  def tasks_params
    params[:task].slice(:content, :reward_description)
  end

end
