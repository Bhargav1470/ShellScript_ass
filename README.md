# ShellScript_ass
Write a shell script to change the values in a file(i.e sig.conf) according to the input passed to the script. The script should ask for all four inputs from the user & also validate the input.<br>
Below are the details of input. In full bracket options are given, you have to restrict the user pass single value for each input from the provided options in the full bracket.<br>
Input:-<br>
1) Component Name [INGESTOR/JOINER/WRANGLER/VALIDATOR]
2) Scale [MID/HIGH/LOW]
3) View [Auction/Bid]
4) Count [single digit number] <br>
Explanation of a conf file line.<br>
view ; scale ; component name ; ETL ; vdopia-etl= count
