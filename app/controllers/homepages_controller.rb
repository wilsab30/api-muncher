require "#{Rails.root}/lib/api_wrapper.rb"
require "#{Rails.root}/lib/Muncher_Hit.rb"

class HomepagesController < ApplicationController

  def search


  end



  def list
    @data = ApiMuncherWrapper.search(params[:search])

  end

  def show
    @recipe = ApiMuncherWrapper.show_details(params[:uri])
  end
end
