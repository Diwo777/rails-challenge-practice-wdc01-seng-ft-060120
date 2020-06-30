class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employee_path(@employee.id)
    else
      render :new
    end 
  end 

  def edit
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to companies_path
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :title, :company_id)
  end 
end
