class ScreenquotesController < ApplicationController

  def new
   
  end


  
  def show


    puts ""
  
    puts "Executing Show Action"
    puts ""
    @quote_list = params[:symbol]
    puts @quote_list
    puts ""

    require 'yahoofinance'

  

    # Set the type of quote we want to retrieve.
    # Available type are:
    #  - YahooFinance::StandardQuote
    #  - YahooFinance::ExtendedQuote
    #  - YahooFinance::RealTimeQuote

    quote_type = YahooFinance::StandardQuote

    # Set the symbols for which we want to retrieve quotes.
    # You can include more than one symbol by separating 
    # them with a ',' (comma).
    

    quote_symbols = @quote_list

    # Get the quotes from Yahoo! Finance.  The get_quotes method call
    # returns a Hash containing one quote object of type "quote_type" for
    # each symbol in "quote_symbols".  If a block is given, it will be
    # called with the quote object (as in the example below).
    # YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
  


    @quote_info = YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|

      puts ""
     # puts "Stock Symbol : #{qt.symbol}"
      puts qt.symbol
      puts qt.bid.to_s
      puts qt.ask.to_s
      #puts qt.to_s 
    end

  end

end
