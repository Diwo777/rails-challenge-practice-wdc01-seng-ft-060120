class CompaniesController < ApplicationController
    def index
        @companies = Company.all
    end
    
    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        
        if @company.save
            redirect_to company_path(@company.id)
        else
            render :new
        end 
    end 

    def company_params
        params.require(:company).permit(:name, :buildings_attributes: [])
    end 
    
end