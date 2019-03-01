class TasksController < ApplicationController
    before_action :set_task, only: [:show,:edit,:update,:destroy]
    #Controllerの名前にはモデルの複数形
    #すなわちリソースの大文字
    def index
        #@tasks = Task.all.page(params[:page]).per(10)
        @tasks = current_user.tasks.order('created_at DESC').all.page(params[:page]).per(10)
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'Taskが正常に登録されました'
            #上に出るあのフラッシュメッセージ
            redirect_to @task
        else
            flash.now[:danger] = 'Taskが登録されませんでした'
            render :new
        end
    end
    
    def new
        @task = current_user.tasks.build
    end
    
    def edit
    end

    def show
    end
    
    def update
         
        if @task.update(task_params)
            flash[:success] = "Taskは正常に更新されました"
            redirect_to @task
        else
            flash.now[:danger] = "Taskは更新されませんでした"
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        flash[:success] = "Taskは正常に削除されました"
        redirect_to tasks_url
    end
    
    
    private 
    
    def set_task
        @task = Task.find(params[:id])
    end
        
    
    def task_params
        params.require(:task).permit(:content,:status)
        #Taskモデルのデータと明示し、contentカラムとステータスだけを抜き出す
    end
end
