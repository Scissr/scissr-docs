---
layout: page
title: Features in version 1
---
| Status  | Description 		  	|
| ------- | ----------------------------- |
| Planned | Field aliases  	             	|
| Planned | Multiple levels 	     	|
| Planned | Number of results specifier 	|
| Planned | JSON formatter		     	|
| Planned | XML formatter		     	|
{: class="table"} 

###Field aliases
Generating data with the default syntax will use the abbreviations as the property names in the end result.

Given:

	fname,lname

Will produce:

	{
		"fname": "Random first name",
		"lname": "Random last name"
	}

Field aliases allows us to specify custom property names by specifying a string followed by a colon (:) before each abbreviation element.

Given:

	"FirstName":fname,"LastName":lname

Will produce:

	{
		"FirstName": "Random first name",
		"LastName": "Random last name"
	}


