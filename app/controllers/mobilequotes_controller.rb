class MobilequotesController < ApplicationController
  def new
  end

  def create
  end

  def show
   puts ""
   @action = "Show Action"
   puts @action
   puts ""
   @stocks = params[:text]
   @callback_no = params[:from]

   puts "Stock:"
   puts @stocks


   puts "Phone no:"
   puts @callback_no

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

    quote_symbols = params[:text]

    # Get the quotes from Yahoo! Finance.  The get_quotes method call
    # returns a Hash containing one quote object of type "quote_type" for
    # each symbol in "quote_symbols".  If a block is given, it will be
    # called with the quote object (as in the example below).
    # YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
    #puts "QUOTING: #{qt.symbol}"
    #puts qt.to_s

    

    @quote = YahooFinance::get_quotes( quote_type, quote_symbols ) do |stock|

    # puts "Stock Symbol : #{stock.symbol}"
    
    puts stock.to_s
    
    api.send "Price quoted for     "+stock.symbol+" Bid: "+stock.bid.to_s+"  Ask: "+stock.ask.to_s, @callback_no
 
    end
  end

end
