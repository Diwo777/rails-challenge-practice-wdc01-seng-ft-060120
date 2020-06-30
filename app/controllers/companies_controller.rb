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
            params[:company][:offices_attributes].each do |index, b_hash|
                b_hash[:offices].each do |office|
                    if office != "" 
                        Office.create(company_id: @company.id, building_id: b_hash[:id], floor: office)
                    end
                end 
                
            end 
            #byebug
            redirect_to company_path(@company.id)
        else
            render :new
        end 
    end 

    def company_params
      
        params.require(:company).permit(:name)
    end 
    
end