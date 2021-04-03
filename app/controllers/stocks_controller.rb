class StocksController < ApplicationController
    
    gem "news-api"
    require "news-api"
    gem "httparty"
    require "httparty"

    def index
        @alphvantagekey = "CVNQRSCEWDQL2YVF"
        @client = Alphavantage::Client.new key: @alphavantagekey
        @stocks = Stock.all
        

        # @stock_msft = client.stock symbol: "MSFT"
        # @stock_msft = Alphavantage::Stock.new symbol: "MSFT", key: key
        # @stock_quote = @stock_msft.quote
        
    end

    def show
        @alphavantagekey = "CVNQRSCEWDQL2YVF"
        @client = Alphavantage::Client.new key: @alphavantagekey
        @newsapi = News.new("3651a3e5ac674c158be991a8076cf34a")  
        #@all_articles = @newsapi.get_everything(q: "bitcoin" ,sources: 'bbc-news,the-verge',domains: 'bbc.co.uk,techcrunch.com',from: '2021-03-30',to: '2021-04-1',language: 'en',sortBy: 'relevancy', page: 1)
        #@top_headlines = @newsapi.get_top_headlines(q: 'apple', sources: 'bbc-news,the-verge', category: 'business', language: 'en', country: 'us')
        
        stock_id = params[:id]
        @stock = Stock.find_by(id: stock_id)
        
    end
end