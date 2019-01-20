#!/bin/sh
sudo update-locale LANG=ja_JP.UTF-8

# set time zone manually
sudo sh -c "echo Asia/Tokyo > /etc/timezone"
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list

