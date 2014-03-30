#/bin/bash
###
#Bash script to download/compile Wallop
#Date: 2014/03/30
#By: Matt Briggs
#For: Ubuntu 12.04 LTS Server
####

#directory
dir=~

#ruby
sudo apt-get remove ruby1.8
sudo apt-get install ruby1.9.1 ruby1.9.1-dev ruby1.9.1-full rubygems
sudo gem install bundle

#git
cd $dir
sudo apt-get install git
git clone https://github.com/maddox/wallop
cd wallop
