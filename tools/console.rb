require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
vincent = Author.new("Vincent")
omondi = Author.new("Omondi")
makokha = Author.new("Makokha")

the_awesome = Magazine.new("The Awesome", "Awesomeness")
zero_to_100 = Magazine.new("Zero to 100", "Old News")
var_check = Magazine.new("VAR Check", "Sports")

vincent.add_article(the_awesome, "The Quick Brown Awesome Fox")
vincent.add_article(the_awesome, "Getting Things Done")
vincent.add_article(the_awesome, "Did You Ever Have One of Those Days?")
omondi.add_article(zero_to_100, "How I Learned to Walk")


### DO NOT REMOVE THIS
binding.pry

0
