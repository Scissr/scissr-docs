---
layout: page
title: Parser
---

###Basic generation
Input:

{:class="scissr-syntax"} 
	joe

Output:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "joe",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "joe"
			}
		]
	}

###Multiple fields
Input:

{:class="scissr-syntax"} 
	joe,soap

Output:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "joe",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "joe"
			},
			{
				"type": "soap",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "soap"
			}
		]
	}

###Field aliases
Input:

{:class="scissr-syntax"} 
	name:joe

Output:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "joe",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "name"
			}
		]
	}

###Arrays
Input:

{:class="scissr-syntax"} 
	(joe)*3

Produces:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "object",
				"baseType": "object",
				"isArray": true,
				"count": "3",
				"data": [],
				"nodes": [
					{
						"type": "joe",
						"baseType": "string",
						"isArray": false,
						"count": 1,
						"data": [],
						"alias": "joe"
					}
				],
				"alias": "objectArray"
			}
		]
	}

Input:

{:class="scissr-syntax"} 
	people:(joe,soap)*3

Produces:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "object",
				"baseType": "object",
				"isArray": true,
				"count": "3",
				"data": [],
				"nodes": [
					{
						"type": "joe",
						"baseType": "string",
						"isArray": false,
						"count": 1,
						"data": [],
						"alias": "joe"
					},
					{
						"type": "soap",
						"baseType": "string",
						"isArray": false,
						"count": 1,
						"data": [],
						"alias": "soap"
					}
				],
				"alias": "people"
			}
		]
	}

Input:
{:class="scissr-syntax"} 
	tags:abc@3

Produces:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "abc",
				"baseType": "string",
				"isArray": true,
				"count": "3",
				"data": [],
				"alias": "tags"
			}
		]
	}

###Multiple levels
Input:

{:class="scissr-syntax"} 
	joe,soap,child:(abc,def)

Produces:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "joe",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "joe"
			},
			{
				"type": "soap",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "soap"
			},
			{
				"type": "object",
				"baseType": "object",
				"isArray": false,
				"count": 1,
				"data": [],
				"nodes": [
					{
						"type": "abc",
						"baseType": "string",
						"isArray": false,
						"count": 1,
						"data": [],
						"alias": "abc"
					},
					{
						"type": "def",
						"baseType": "string",
						"isArray": false,
						"count": 1,
						"data": [],
						"alias": "def"
					}
				],
				"alias": "child"
			}
		]
	}

Input:

{:class="scissr-syntax"} 
	joe,soap,children:(abc,def)*3

Produces:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "joe",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "joe"
			},
			{
				"type": "soap",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "soap"
			},
			{
				"type": "object",
				"baseType": "object",
				"isArray": true,
				"count": "3",
				"data": [],
				"nodes": [
					{
						"type": "abc",
						"baseType": "string",
						"isArray": false,
						"count": 1,
						"data": [],
						"alias": "abc"
					},
					{
						"type": "def",
						"baseType": "string",
						"isArray": false,
						"count": 1,
						"data": [],
						"alias": "def"
					}
				],
				"alias": "children"
			}
		]
	}

###Format generator
Given:

{:class="scissr-syntax"} 
	string,int=json

Produces:

	{
		"parser": "scissr",
		"generator": "json",
		"nodes": [
			{
				"type": "string",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "string"
			},
			{
				"type": "int",
				"baseType": "int",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "int"
			}
		]
	}

Given:

{:class="scissr-syntax"} 
	string,int=xml

Produces:

	{
		"parser": "scissr",
		"generator": "xml",
		"nodes": [
			{
				"type": "string",
				"baseType": "string",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "string"
			},
			{
				"type": "int",
				"baseType": "int",
				"isArray": false,
				"count": 1,
				"data": [],
				"alias": "int"
			}
		]
	}