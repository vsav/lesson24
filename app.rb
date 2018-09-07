require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit

end

get '/contacts' do
  erb :contacts

end

post '/visit' do

	@name = params[:username]
	@phone = params[:phone]
	@date = params[:datetime]
  @master = params[:master]
  if @name != "" && @phone != "" && @date != ""
	  @ok_message = "Thank you, #{@name}! We'll be waiting for you at #{@date}"

    f = File.open('./public/visitors.txt', 'a')
    f.write "Name: #{@name}, Phone: #{@phone}, Visit date: #{@date}, Master: #{@master} \n"
    f.close

  elsif @name == ""
    @name_error_message = "Please enter your name"
  elsif @phone == ""
    @phone_error_message = "Please enter your phone number"
  elsif @date == ""
    @date_error_message = "Please choose visit date"
  end

  erb :visit
end

post '/contacts' do
  @email = params[:email]
  @message = params[:message]
  f = File.open('./public/contacts.txt', 'a')
  f.write " \n From: #{@email}\n Message: #{@message} \n ********************************************************** \n"
  f.close
  @sent_message = "Спасибо! Ваше сообщение отправлено"
  erb :contacts
end