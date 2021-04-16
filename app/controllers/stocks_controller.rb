class StocksController < ApplicationController
    
    gem "news-api"
    require "news-api"
    gem "httparty"
    require "httparty"
    gem "chartkick"
    require "chartkick"

    def index
        @alphvantagekey = "CVNQRSCEWDQL2YVF"
        @client = Alphavantage::Client.new key: @alphavantagekey
        @newsapi = News.new("3651a3e5ac674c158be991a8076cf34a")  
        @stocks = Stock.all

        # @stock_msft = client.stock symbol: "MSFT"
        # @stock_msft = Alphavantage::Stock.new symbol: "MSFT", key: key
        # @stock_quote = @stock_msft.quote
        
        if session[:number].nil?
            session[:number] = 0
        end

        session[:number] = session[:number] + 1
        @number = session[:number]

        time = Time.new
        #'2021-04-9'
        @currentdate = "#{time.year}-#{time.month}-#{time.day}"
    end

    def show
        @alphavantagekey = "CVNQRSCEWDQL2YVF"
        @client = Alphavantage::Client.new key: @alphavantagekey
        @newsapi = News.new("3651a3e5ac674c158be991a8076cf34a")  
        #@all_articles = @newsapi.get_everything(q: "bitcoin" ,sources: 'bbc-news,the-verge',domains: 'bbc.co.uk,techcrunch.com',from: '2021-03-30',to: '2021-04-1',language: 'en',sortBy: 'relevancy', page: 1)
        #@top_headlines = @newsapi.get_top_headlines(q: 'apple', sources: 'bbc-news,the-verge', category: 'business', language: 'en', country: 'us')
        
        stock_id = params[:id]
        @stock = Stock.find_by(id: stock_id)

        #indicator SMA
        #@indicator = @stock.indicator(function: "SMA", interval: "weekly", time_period: "60", series_type: "close")
        time = Time.new
        #'2021-04-9'
        @currentdate = "#{time.year}-#{time.month}-#{time.day}"
        @priordate = "#{time.year}-#{time.month}-#{time.day-3}"
        
    end

    def new
        @stock = Stock.new
    end

    def create
        name = params[:stock][:name]
        ticker = params[:stock][:ticker]
        Stock.create(name: name, ticker: ticker)
        redirect_to stocks_path
    end

    def edit
        stock_id = params[:id]
        @stock = Stock.find_by(id: stock_id)
    end

    def update
        stock_id = params[:id]
        @stock = Stock.find_by(id: stock_id)

        name = params[:stock][:name]
        ticker = params[:stock][:ticker]

        @stock.update(name: name, ticker: ticker)

        redirect_to stock_path(@stock)
    end

    def destroy
        @stock = Stock.find(params[:id])
        @stock.destroy
     
        redirect_to stocks_path
     end

     #Charts

    # require 'rubygems'
    # require 'google_chart'
    # require File.join(File.dirname(__FILE__),'..','stock_data.rb')

    # #indicator = Alphavantage::Indicator.new function: "SMA", symbol: @stock.ticker, key: @alphavantagekey

    # # date_array = [indicator.sma[0][0], indicator.sma[1][0], indicator.sma[2][0]]
    # # sma_array = [indicator.sma[0][1], indicator.sma[1][1], indicator.sma[2][1]]
     
    #  x = date_array; y = sma_array
    #  data = StockData.for('RBS.L', 365)
    #  data.each {|d| x << d[0]; y << d[1]}
    #  y.reverse!
     
    #  # Line Chart
    #  GoogleChart::LineChart.new('400x300', "RBS.L", false) do |lc|
    #    lc.data "RBS.L", y, '0000ff'
    #    lc.grid(:x_step => 100.0/12.0,
    #            :y_step => 100.0/6.0,
    #            :length_segment => 1,
    #            :length_blank => 0)
    #    lc.axis(:x,
    #            :range => [0,12],
    #            :labels => %w(d j f m a m j j a s o n d)
    #            )
    #    puts lc.to_url
    #  end


end