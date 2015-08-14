class ProxyController < ApplicationController
  require 'open-uri'

  def highlighter
    @user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36'

    nokogiri_doc = Nokogiri::HTML(get_webpage_content.read)

    render :inline => nokogiri_doc.to_html
  end

  private

    def get_webpage_content
      open(params[:url], 'User-Agent' => @user_agent)
    rescue => e
      if e.message.include?('redirection forbidden')
        if params[:url].include?('https')
          params[:url].gsub!('https', 'http')
        else
          params[:url].gsub!('http', 'https')
        end
        return open(params[:url], 'User-Agent' => @user_agent)
      end
    end

end