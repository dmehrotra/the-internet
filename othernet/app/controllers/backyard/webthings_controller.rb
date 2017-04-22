module Backyard
  class WebthingsController < ApplicationController
  	include ApplicationHelper
	  before_filter :check_admin?
    def index  
  		
  	end
    def show

    end
    def edit

      @webpage = Webpage.find(params[:id])
      render_form(@webpage)
    end
  	def new
  		@webpage = Webpage.new
  	end
    def destroy
      @p = Webpage.find(params[:id])
      @p.things.each do |t|
        t.destroy
      end
      @p.destroy
      redirect_to backyard_path
    end
    def update
      @webpage = Webpage.find(params[:id])
      if @webpage.update(page_params)
         redirect_to "http://www.test.com"
      else
         neighborhood_webthings_path
      end

    end
  	def create

  	  @webpage = Webpage.new(page_params)
      if params["commit"] == 'Next' 

        @webpage.neighbor = current_neighbor
  		  form = Type.build_fields(@webpage)
        render_form(@webpage)
      
      elsif params["commit"] != 'Next' 
        if @webpage.save
          if @webpage.type.name == "thing"
            create_web_thing
          else
            redirect_to "www.test.com"
          end
          
        else
          render_form(@webpage)
        end
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
    def create_web_thing
      if params["things"]["file"].length > 0 
        params["things"]["file"].each do |t|
          new_file = Thing.new(name:"thing",webpage_id:@webpage.id,file:t)
          if new_file.save
            print "saved file"
          else
            new_page = @webpage.dup
            new_page.id = nil
            @webpage.delete
            @webpage = new_page
            render_form(new_page)
          end
        end
        @webpage.handle_references
        redirect_to backyard_path
      else
        new_page = @webpage.dup
        new_page.id = nil
        @webpage.delete
        @webpage = new_page
        render_form(new_page)
      end
    end
  	def page_params
      params.require(:webpage).permit(
        :neighbor_id,:name,:url,:html,:type_id,:step,:bg_img,:otherpic,:description, :title, :headline, :section_one_title, :section_one_content, 
        :section_two_title, :section_two_content, :section_three_title, :section_three_content,
        :text_under_image, things_attributes: [:id,:file, :post_id])
    end

    def render_form(webpage)
      form = Type.build_fields(webpage)
      render 'create_webpage_form', locals: {form_fields: form,notice: params["commit"] == 'Next' ? '' : webpage.errors.full_messages}
    end

  end
end

