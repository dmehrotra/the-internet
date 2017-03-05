module Lodge
  class WebthingsController < ApplicationController
  	include ApplicationHelper
	  before_filter :check_admin?
    def index  
  		
  	end
    def show
      file = @current_another.webpages.find(params[:id]).things.first.file.path
      extension = @current_another.webpages.find(params[:id]).things.first.file.file.extension

      disposition = 'attachment'
      mime = MIME::Types.type_for(file).first.content_type
      if %w{jpg png jpg gif bmp}.include?(extension) or extension == "pdf"
        disposition = 'inline'
      end
      send_file(file, :filename => file, :disposition => 'inline', :type => mime)

    end
  	def new
  		@webpage = Webpage.new
  	end

  	def create
  	  @webpage = Webpage.new(page_params)
      if params["commit"] == 'Next' 
        @webpage.another = current_another
  		  form = Type.build_fields(@webpage)
        render_form
      elsif params["commit"] != 'Next' && @webpage.type.name == "thing"
        if @webpage.save!
          create_web_thing
        else
          render_form
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
      if params["webpage"]["thing"].present?
        @thing = Thing.new(name:@webpage.name,webpage_id:@webpage.id,file:params["webpage"]["thing"])
        if @thing.save
          redirect_to new_lodge_webthing_path
        else
          @webpage.delete
          render_form
        end

      else
        render_form
      end
    
    end
  	def page_params
      params.require(:webpage).permit(:another_id,:name,:url,:html,:type_id,:step,:thing)
    end

    def render_form
      form = Type.build_fields(@webpage)
      render 'create_webpage_form', locals: {form_fields: form,notice: params["commit"] == 'Next' ? '' : @webpage.errors.full_messages}
    end

  end
end