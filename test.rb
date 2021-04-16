
gem 'googlecharts'
require 'googlecharts'
require File.join(File.dirname(__FILE__),'..','stock_data.rb')

#indicator = Alphavantage::Indicator.new function: "SMA", symbol: @stock.ticker, key: @alphavantagekey

# date_array = [indicator.sma[0][0], indicator.sma[1][0], indicator.sma[2][0]]
# sma_array = [indicator.sma[0][1], indicator.sma[1][1], indicator.sma[2][1]]
 
 x = []; y = []
 data = StockData.for('RBS.L', 365)
 data.each {|d| x << d[0]; y << d[1]}
 y.reverse!
 
 # Line Chart
 GoogleChart::LineChart.new('400x300', "RBS.L", false) do |lc|
   lc.data "RBS.L", y, '0000ff'
   lc.grid(:x_step => 100.0/12.0,
           :y_step => 100.0/6.0,
           :length_segment => 1,
           :length_blank => 0)
   lc.axis(:x,
           :range => [0,12],
           :labels => %w(d j f m a m j j a s o n d)
           )
   puts lc.to_url
 end