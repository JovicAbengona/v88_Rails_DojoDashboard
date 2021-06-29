class StudentsController < ApplicationController
    def new
        @dojos = Dojo.all
        @dojo = Dojo.find(params[:id])
    end

    def create
        final_params = student_params
        final_params[:dojo] = Dojo.find(student_params[:dojo])
        student = Student.create(final_params)
        if student.valid?
            redirect_to "/dojos/#{params[:id]}"
        else
            flash[:errors] = student.errors.full_messages
            redirect_to "/dojos/#{params[:id]}/students/new"
        end
    end

    def show
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:student_id])
        @students = @dojo.students.where.not(id: params[:student_id])
    end

    def edit
        @dojos = Dojo.all
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:student_id])
    end

    def update
        student = Student.find(params[:id])
        final_params = student_params
        final_params[:dojo] = Dojo.find(student_params[:dojo])
        student.update(final_params)
        if student.valid?
            redirect_to "/dojos/#{student.dojo.id}/students/#{student.id}"
        else
            flash[:errors] = student.errors.full_messages
            redirect_to "/dojos/#{student.dojo.id}/students/#{student.id}/edit"
        end
    end

    def delete
        student = Student.find(params[:id])
        dojo_id = student.dojo.id
        student.destroy
        redirect_to "/dojos/#{dojo_id}"
    end

    private
        def student_params
            params.require(:student).permit(:first_name, :last_name, :email, :dojo)
        end
end
