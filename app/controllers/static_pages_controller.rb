require 'flickraw'

class StaticPagesController < ApplicationController
  def home
    flickr = FlickRaw::Flickr.new(api_key: ENV['FLICKRAW_API_KEY'], shared_secret: ENV['FLICKRAW_SHARED_SECRET'])
    @photos = flickr.photos.search(user_id: params[:flickr][:id]) if params[:flickr]
    @default_value = default_value
  end

  private
    def default_value
      params[:flickr] ? params[:flickr][:id] : "Flickr id"
    end
end