require 'rubygems'
require 'mechanize'
require 'nokogiri'

def signIn(login,pass)

	puts "Please insert String" unless login.is_a? String
	a = Mechanize.new { |agent|
		agent.user_agent_alias = 'Mac Safari'
	}

	a.get('https://github.com/login') do |page|
		puts "running..."
		puts page.inspect
		form = page.forms.last
		form.login = login
		form.password = pass
		result_page = a.submit(form, form.buttons.first)
		#puts login_result.body
		if result_page.title == "GitHub"
			10.times {puts "================="} 
			puts result_page.css('title')
			puts result_page.uri.to_s
		else
			puts "Wrong credentials"
			puts result_page.css('title')
		end

		
	end
	
end


print "Username: "
login = gets.chomp
print "Password: "
pass = gets.chomp

signIn(login,pass)


