---
layout: page
title: Features in version 0.1
---
| Status  | Description 		  					 |
| ------- | ---------------------------------------------------------- |
| Done | [Basic generation](#basic-generation)			 |
| Done | [Multiple fields](#multiple-fields)             		 |
| Done | [Field aliases](#field-aliases)	             	 	 |
| Done | [Arrays](#arrays) 						 |
| Done | [Multiple levels](#multiple-levels)     	  		 |
| Done | [Basic value resolving](#basic-value-resolving)      	 |
| In progress | [Basic formatters](#basic-formatters) 			 |
{: class="table"} 

###Basic generation
Generating data with the basic minimum syntax will use the abbreviation as the property name in the end result.

Given:

{:class="scissr-syntax"} 
	joe

Produces:

	{
		"joe": "joe"
	}

###Multiple fields
You can specify multiple fields for the generation by delimiting them with the comma operator (`,`).

Given:

{:class="scissr-syntax"} 
	joe,soap

Produces:

	{
		"joe": "joe",
		"soap": "soap"
	}

###Field aliases
Field aliases allows us to customize property names by specifying a string followed by the colon operator (`:`) before each abbreviation element.

Given:

{:class="scissr-syntax"} 
	name:joe

Produces:

	{
		"name": "joe"
	}

Aliases can be any string value. It is also possible for aliases to have spaces. Simply wrap the string in single quotation marks (`'`).

Given:

{:class="scissr-syntax"} 
	'First Name':joe

Produces:

	{
		"First Name": "joe"
	}

###Arrays
By default the result is generated as a single object. You can create an object arrays with specific number of items by making use of the astrix operator (`*`) followed by a number that specifies the total number of items.

Given:

{:class="scissr-syntax"} 
	(joe)*3

Produces:

	{
		"objectArray":
		[
			{
				"joe": "joe"
			},
			{
				"joe": "joe"
			},
			{
				"joe": "joe"
			}
		]
	}

For multiple fields:

{:class="scissr-syntax"} 
	people:(joe,soap)*3

Produces:

	{
		"people":
		[
			{
				"joe": "joe",
				"soap": "soap"
			},
			{
				"joe": "joe",
				"soap": "soap"
			},
			{
				"joe": "joe",
				"soap": "soap"
			}
		]
	}

To generate simple type arrays use the `@` operator:

{:class="scissr-syntax"} 
	tags:abc@3

Produces:

	{
		"tags":
		[
			"abc",
			"abc",
			"abc"
		]
	}

###Multiple levels
Sometimes you need to generate more complex data. Scissr supports multiple level structures of N-level deep. Use the brackets to denote a child level.

Given:

{:class="scissr-syntax"} 
	joe,soap,child:(abc,def)

Produces:

	{
		"joe": "joe",
		"soap": "soap",
		"child": {
			"abc": "abc",
			"def": def
		}
	}

This scenario also supports N-number of child results. Like mentioned before, this is specified by the astrix operator (*) followed by the number of items.

Given:

{:class="scissr-syntax"} 
	joe,soap,children:(abc,def)*3

Produces:

	{
		"joe": "joe",
		"soap": "soap",
		"children": 
		[
			{
				"abc": "abc",
				"def": "def"
			},
			{
				"abc": "abc",
				"def": "def"
			},
			{
				"abc": "abc",
				"def": "def"
			}
		]
	}

###Basic value resolving
Scissr comes out of the box with support for the following primitive types:

| Type		|
| ----------- |
| string	|
| int	|
| float	|
| date		|
| bool		|
{: class="table"}

Given any of the above mentioned types will return a random value based from the specified type:

{:class="scissr-syntax"} 
	string

Produces:

	{
		"string": "Lorem ipsum dolor sit amet"
	}

Given:

{:class="scissr-syntax"} 
	int

Produces:

	{
		"int": 32
	}

In the event where you need to override the value resolving and explicitly declare the element value of a valid type, just use single quotes (`'`) around the element:

Given:

{:class="scissr-syntax"} 
	'string'

Produces:

	{
		"string": "string"
	}

###Basic formatters
By default Scissr renders the output result in JSON if no explicit formatter is specified as it is inferred. To explictly specify a formatter, we use the equals operator (=) followed by the formatter identifier.

Given:

{:class="scissr-syntax"} 
	string,int=json

Produces:

	{
		"string": "Lorem ipsum dolor sit amet",
		"int": 23
	}

XML is also supported out of the box:

{:class="scissr-syntax"} 
	string,int=xml

Produces:

	<object>
		<string>candy</string>
		<int>51</int>
	</object>
