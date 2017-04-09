module Backyard
  class WebthingsController < ApplicationController
  	include ApplicationHelper
	  before_filter :check_admin?
    def index  
  		
  	end
    def show
      file = @current_neighbor.webpages.find(params[:id]).things.first.file.path
      extension = @current_neighbor.webpages.find(params[:id]).things.first.file.file.extension

      disposition = 'attachment'
      mime = MIME::Types.type_for(file).first.content_type
      if %w{jpg png jpg gif bmp mov}.include?(extension) or extension == "pdf"
        disposition = 'inline'
      end
      send_file(file, :filename => file, :disposition => 'inline', :type => mime)

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
  	def create

  	  @webpage = Webpage.new(page_params)
      if params["commit"] == 'Next' 
        @webpage.neighbor = current_neighbor
  		  form = Type.build_fields(@webpage)
        render_form(@webpage)
      elsif params["commit"] != 'Next' && @webpage.type.name == "thing"
        if @webpage.save
          create_web_thing
          
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
          new_file = Thing.new(name:@webpage.name,webpage_id:@webpage.id,file:t)
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
        :neighbor_id,:name,:url,:html,:type_id,:step,
        things_attributes: [:id,:file, :post_id])
    end

    def render_form(webpage)
      form = Type.build_fields(webpage)
      render 'create_webpage_form', locals: {form_fields: form,notice: params["commit"] == 'Next' ? '' : webpage.errors.full_messages}
    end

  end
end