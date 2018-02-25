class GroupedSubscribersController < ApplicationController

  before_action :set_companies

  def managers
    
  end

  def payers

  end

  private

    def set_companies
      @companies = Company.all
    end

end
