---
layout: page
title: Features in version 0.1
---
| Status  | Description 		  					 |
| ------- | ---------------------------------------------------------- |
| Planned | [Basic generation](#basic-generation)			 |
| Planned | [Multiple fields](#multiple-fields)             		 |
| Planned | [Field aliases](#field-aliases)	             	 	 |
| Planned | [Basic value resolving](#basic-value-resolving)      	 |
| Planned | [Control number of results](#control-number-of-results)	 |
| Planned | [Multiple levels](#multiple-levels)     	  		 |
| Planned | [Basic formatters](#basic-formatters) 			 |
{: class="table"} 

###<a name="basic-generation"></a>Basic generation
Generating data with the basic minimum syntax will use the abbreviation as the property name in the end result.

Given:

	joe

Produces:

	{
		"joe": "joe"
	}

###<a name="multiple-fields"></a>Multiple fields
You can specify multiple fields for the generation by delimiting them with a comma (,).

Given:

	joe,soap

Produces:

	{
		"joe": "joe",
		"soap": "soap"
	}

###<a name="field-aliases"></a>Field aliases
Field aliases allows us to customize property names by specifying a string followed by a colon (:) before each abbreviation element.

Given:

	name:joe

Produces:

	{
		"name": "joe"
	}

Aliases can be any string value. It is also possible for aliases to have spaces. Simply wrap the string in single quotation marks (').

Given:

	'First Name':joe

Produces:

	{
		"First Name": "joe"
	}

###<a name="basic-value-resolving"></a>Basic value resolving
Scissr comes out of the box with support for the following primitive types:

| Type		|
| ----------- |
| string	|
| number	|
| float	|
| date		|
| bool		|
{: class="table"}

Given any of the above mentioned types will return a random value based from the specified type:

	string

Produces:

	{
		"string": "cake"
	}

Given:
	number

Produces:

	{
		"number": 32
	}

###<a name="control-number-of-results"></a>Control number of results
By default the result is generated as a single object. You can control the number of items to generate by making use of astrix (*) followed by a number that specifies the total number of items.

Given:

	string*3

Produces:

	[
		{
			"string": "boat"
		},
		{
			"string": "car"
		},
		{
			"string": "plant"
		}
	]

For multiple fields, you need to wrap them in brackets before specifying the multiplication operator:

	(string,number)*3

Produces:

	[
		{
			"string": "boat",
			"number": 32
		},
		{
			"string": "bicycle",
			"number": 43
		},
		{
			"string": "tree",
			"number": 101
		}
	]

###<a name="multiple-levels"></a>Multiple levels
Sometimes you need to generate more complex data. Scissr supports multiple level structures of N-level deep. Use the brackets to denote a child level.

Given:

	string,number,(date,bool)

Produces:

	{
		"string": "shoe",
		"number": 25,
		"date,bool": {
			"date": "2012-04-23T18:25:43.511Z",
			"bool": true
		}
	}

This scenario also supports N-number of child results. Like mentioned before, this is specified by astrix (*) followed by the number of items.

Given:

	string,number,(date,bool)*3

Produces:

	{
		"string": "shoe",
		"number": 25,
		"date,bool": 
		[
			{
				"date": "2012-04-13T18:25:43.511Z",
				"bool": false
			},
			{
				"date": "2012-02-23T18:25:43.511Z",
				"bool": false
			},
			{
				"date": "2010-04-23T18:25:43.511Z",
				"bool": true
			}
		]
	}

###<a name="basic-formatters"></a>Basic formatters
By default Scissr renders the output result in JSON as it is infers it if no explicit formatter is specified. To explictly specify a formatter, we use a dot (.) followed by the formatter identifier.

Given:

	(string,number).json

Produces:

	{
		"string": "sailor",
		"number": 23
	}

XML is also supported out of the box:

	(string,number).xml

Produces:

	<string>candy</string>
	<number>51</number>

