class CurrencyController < ApplicationController

  def first_page

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbol_hash = @parsed_data.fetch("symbols")
  
    @array_symbol = @symbol_hash.keys
    
    render({ :template => "currency_templates/first.html.erb" })
  end

  def second_page
  
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbol_hash = @parsed_data.fetch("symbols")
  
    @array_symbol = @symbol_hash.keys
    
    @from_symbol = params.fetch("from_currency")
    render({ :template => "currency_templates/second.html.erb" })
  end

  def result_page
    @from_curr = params.fetch("from_currency")
    @to_curr = params.fetch("to_currency")
    @raw_result = open("https://api.exchangerate.host/convert?from=#{@from_curr}&to=#{@to_curr}").read
    @parsed_result = JSON.parse(@raw_result)
    @result = @parsed_result.fetch("result")
 
    render({ :template => "currency_templates/result.html.erb" })
  end

end
