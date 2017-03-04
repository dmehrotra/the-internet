module Lodge
  class WebpagesController < ApplicationController
  	include ApplicationHelper
	  before_filter :check_admin?
    def index  
  		
  	end

  	def new
  		@webpage = Webpage.new
  	end

  	def create
  	  @page = Webpage.new(page_params)
      if params["commit"] == 'Next' || !@page.valid?
        binding.pry
        @page.another = current_another
  		form = Type.build_fields(@page)
        render 'create_post_form', locals: {form_fields: form, notice: params["commit"] == 'Next' ? '' : @post.errors.full_messages}
      end


      # else
      #   @post.save
  	   #  @post.associate_job(params[:post]["job_id"]) unless !params[:post]["job_id"].present? 
      #   params[:post]["category_ids"].each{|category| @post.assign_category(category) unless !category.present?}
      #   if params["preview"].present?
      #     redirect_to post_path(@post.id)
      #   else  
      #     redirect_to edit_dashboard_post_path(@post.id)
      #   end
      # end	

  	end


  	def page_params
      params.require(:webpage).permit(:html,:type_id,:step,:thing)
    end
  end
end