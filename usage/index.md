---
layout: page
title: Usage
---

Scissr runs on special abbreviations that are expressed in a equation-like style. These expressions are parsed during runtime and transformed into sample data with a specific format, like JSON for example.

Example: This abbreviation:

	(fname,lname,age)*3

...transforms into:

	[
		{
			"fname": "Joe",
			"lname": "Soap",
			"age": 21
		},
		{
			"fname": "Peter",
			"lname": "Parker",
			"age": 32
		},
		{
			"fname": "William",
			"lname": "Wallace",
			"age": 44
		}
	]

### Full syntax
	("FirstName":fname,"LastName":lname,"Contacts":("Home":tel,"Office":tel))*3.xml["People"]