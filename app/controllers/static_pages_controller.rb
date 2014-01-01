class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

    case params[:category]
    when 'Health'
      @feed_items = Micropost.where("category == ?", "Health").paginate(page: params[:page])
    when 'Fitness'
      @feed_items = Micropost.where("category == ?", "Fitness").paginate(page: params[:page])
    when 'Family'
      @feed_items = Micropost.where("category == ?", "Family").paginate(page: params[:page])
    when 'Religion'
      @feed_items = Micropost.where("category == ?", "Religion").paginate(page: params[:page])  
    # when 'Human'
      # @feed_items = Micropost.where("category == ?", "").paginate(page: params[:page])
    when 'Relations'
      @feed_items = Micropost.where("category == ?", "Relations").paginate(page: params[:page])
    when 'Leadership'
      @feed_items = Micropost.where("category == ?", "Leadership").paginate(page: params[:page])
    else
      # @feed_items = Micropost.all.paginate(page: params[:page])  
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
