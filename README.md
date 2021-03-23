# eu4ghostfinder
wireshark script that lists a player's ip along with their in-game name upon join

credits to:
KLS - packet dissection and testing help

![alt text](https://cdn.discordapp.com/attachments/811816879668199446/823638054006030376/a2afa64e5392bf182489492b0eb63a4f.png)

installation (easy way):

paste the entire contents of ghostfinder.lua at the bottom of init.lua in the wireshark installation folder

usage:

have wireshark be recording network traffic before you host your lobby/before anyone else joins

click tools->eu4->ghost finder

the script will update with new players as they connect

the player name is sometimes inaccurate, but the ip is always correct

new empty name ip gets added to the list while eu4 says nobody has connected = that ip is a ghost
