class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

    if params[:health]
      @feed_items = current_user.feed.paginate(page: :category params[:page])
    else
      5.times { puts "No Malcolm!!!" }
    end

    if params[:fitness]
      5.times { puts "Malcolm!!!" }
    else
      5.times { puts "No Malcolm!!!" }
    end

    if params[:family]
      5.times { puts "Malcolm!!!" }
    else
      5.times { puts "No Malcolm!!!" }
    end

    if params[:religion]
      5.times { puts "Malcolm!!!" }
    else
      5.times { puts "No Malcolm!!!" }
    end

       if params[:humanrelationships]
      5.times { puts "Malcolm!!!" }
    else
      5.times { puts "No Malcolm!!!" }
    end

       if params[:leadership]
      5.times { puts "Malcolm!!!" }
    else
      5.times { puts "No Malcolm!!!" }
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
