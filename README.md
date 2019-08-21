# Split-or-join-semicolon-sapared-values
Split semicolon sapared values to multiple line or join multiline repeated values in single line in 2nd column. (2 colmun file)

* join.pl script makes 1st column unique and puts relevent elements of 2nd column in 1 row separated by semicolon.

Example: 

INPUT
	chr17_7579867_G_A	COSM100007
	chr17_7579867_G_A	COSM100008
	chr17_7579867_G_A	COSM100010  


OUTPUT
	chr17_7579867_G_A	COSM100007; COSM100008; COSM100010
  
  
  
  
* split_and_repeat.pl script splits 2nd column by semicolon and puts elements on new row with repeated relevent 1st column element.

Example: 

INPUT
	chr17_7579867_G_A	COSM100007; COSM100008; COSM100010


OUTPUT
	chr17_7579867_G_A	COSM100007
	chr17_7579867_G_A	COSM100008
	chr17_7579867_G_A	COSM100010 
