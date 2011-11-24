class ScreenquotesController < ApplicationController

  def new
   
  end

 

  def create
  
  end

  def show
   puts ""
   @action = "Show Action"
   puts @action
   puts ""
   @symbol = params[:symbol]
   puts @symbol
   puts ""

   require 'yahoofinance'

   require 'textmagic'

   # Set usercode and password
   api = TextMagic::API.new("mcgournj","1dkmJ4QUcBItZ6e")
    

    # Set the type of quote we want to retrieve.
    # Available type are:
    #  - YahooFinance::StandardQuote
    #  - YahooFinance::ExtendedQuote
    #  - YahooFinance::RealTimeQuote

    quote_type = YahooFinance::StandardQuote

    # Set the symbols for which we want to retrieve quotes.
    # You can include more than one symbol by separating 
    # them with a ',' (comma).
    

    quote_symbols = params[:symbol]

    # Get the quotes from Yahoo! Finance.  The get_quotes method call
    # returns a Hash containing one quote object of type "quote_type" for
    # each symbol in "quote_symbols".  If a block is given, it will be
    # called with the quote object (as in the example below).
    # YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
    #puts "QUOTING: #{qt.symbol}"
    #puts qt.to_s

    @stock = params[:symbol]
    puts @stock
    puts ""

    @quote = YahooFinance::get_quotes( quote_type, quote_symbols ) do |stock|

    puts "Stock Symbol : #{stock.symbol}"
    
    puts stock.to_s
    
    api.send "Price quoted for "+quote_symbols.to_s+"is "+stock.ask.to_s, "353862210662"
 
    end

  end

end
