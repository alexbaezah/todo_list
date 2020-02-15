class TodosController < ApplicationController
    before_action :find, only: [:edit, :show, :destroy, :update, :complete]
    
    
    
    def index
        @todos = Todo.all.order(:completed)
    end
    
    def new
        @todo = Todo.new
    end
    
    def create
        @todo = Todo.new(todo_params)
        if @todo.save         
            redirect_to todos_path
        else
            render('new')
        end
    end
    
    def show
        @todo = find
        if @todo.completed == true
          @done = "Está hecha."
        else
          @done = "Aun no ha sido completada."
        end
    end
    
    def edit
        
    end
    
    def update
        
        @todo.update(todo_params)
        redirect_to todos_path
    end
    
    def destroy
        
        @todo.delete
        redirect_to todos_path
    end

    def complete
        
        @todo.update(completed: true)
        redirect_to todos_path
    end
    
    def list
        @todos_undone = Todo.undone
        @todos_done = Todo.done
    end
    
    private
    
    def find
        @todo = Todo.find(params[:id])
    end
    
    def todo_params
        params.require(:todo).permit(:description, :completed)
    end
    
end
