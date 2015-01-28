---
layout: page
title: Parser
---

###Basic generation
Input:

{:class="scissr-syntax"} 
	joe

Output:
{% highlight javascript %}
{{site.data.basic-generation | pretty_json}}
{% endhighlight %}

###Multiple fields
Input:

{:class="scissr-syntax"} 
	joe,soap

Output:
{% highlight javascript %}
{{site.data.multiple-fields | pretty_json}}
{% endhighlight %}

###Field aliases
Input:

{:class="scissr-syntax"} 
	name:joe

Output:
{% highlight javascript %}
{{site.data.multiple-fields | pretty_json}}
{% endhighlight %}
	

###Arrays
Input:

{:class="scissr-syntax"} 
	joe*3

Produces:

	{
		"parser": "scissr",
		"formatter": "json",
		"nodes": [
			{
				"type": {
					"name": "object",
					"isArray": true,
					"length": 3
				},
				"alias": "joeArray",
				"nodes": [
					{
						"resolver": "joe",
						"type": {
							"name": "string",
							"isArray": false,
							"length": 1
						},
						"alias": "joe"
					}
				]
			}
		]
	}

Input:

{:class="scissr-syntax"} 
	people:(joe,soap)*3

Produces:

	{
		"parser": "scissr",
		"formatter": "json",
		"nodes": [
			{

				"type": {
					"name": "object",
					"isArray": true,
					"length": 3
				},
				"alias": "people",
				"nodes": [
					{
						"resolver": "joe",
						"type": {
							"name": "string",
							"isArray": false,
							"length": 1
						},
						"alias": "joe"
					},
					{
						"resolver": "soap",
						"type": {
							"name": "string",
							"isArray": false,
							"length": 1
						},
						"alias": "soap"
					}
				]
			}
		]
	}

Input:
{:class="scissr-syntax"} 
	tags:abc@3

Produces:

	{
		"parser": "scissr",
		"formatter": "json",
		"nodes": [
			{
				"resolver": "abc",
				"type": {
					"name": "string",
					"isArray": true,
					"length": 3
				},
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
		"formatter": "json",
		"nodes": [
			{
				"resolver": "joe",
				"type": {
					"name": "string",
					"isArray": false,
					"length": 1
				},
				"alias": "joe"
			},
			{
				"resolver": "soap",
				"type": {
					"name": "string",
					"isArray": false,
					"length": 1
				},
				"alias": "soap"
			},
			{
				"type": {
					"name": "object",
					"isArray": false,
					"length": 1
				},
				"alias": "child",
				"nodes": [
					{
						"resolver": "abc",
						"type": {
							"name": "string",
							"isArray": false,
							"length": 1
						},
						"alias": "abc"
					},
					{
						"resolver": "def",
						"type": {
							"name": "string",
							"isArray": false,
							"length": 1
						},
						"alias": "def"
					}
				]
			}
		]
	}

Input:

{:class="scissr-syntax"} 
	joe,soap,children:(abc,def)*3

Produces:

	{
		"parser": "scissr",
		"formatter": "json",
		"nodes": [
			{
				"resolver": "joe",
				"type": {
					"name": "string",
					"isArray": false,
					"length": 1
				},
				"alias": "joe"
			},
			{
				"resolver": "soap",
				"type": {
					"name": "string",
					"isArray": false,
					"length": 1
				},
				"alias": "soap"
			},
			{
				"type": {
					"name": "object",
					"isArray": true,
					"length": 3
				},
				"alias": "children",
				"nodes": [
					{
						"resolver": "abc",
						"type": {
							"name": "string",
							"isArray": false,
							"length": 1
						},
						"alias": "abc"
					},
					{
						"resolver": "def",
						"type": {
							"name": "string",
							"isArray": false,
							"length": 1
						},
						"alias": "def"
					}
				]
			}
		]
	}

###Formatter
Given:

{:class="scissr-syntax"} 
	string,number=json

Produces:

	{
		"parser": "scissr",
		"formatter": "json",
		"nodes": [
			{
				"resolver": "string",
				"type": {
					"name": "string",
					"isArray": false,
					"length": 1
				},
				"alias": "string"
			},
			{
				"resolver": "number",
				"type": {
					"name": "number",
					"isArray": false,
					"length": 1
				},
				"alias": "number"
			}
		]
	}

Given:

{:class="scissr-syntax"} 
	string,number=xml

Produces:

	{
		"parser": "scissr",
		"formatter": "xml",
		"nodes": [
			{
				"resolver": "string",
				"type": {
					"name": "string",
					"isArray": false,
					"length": 1
				},
				"alias": "string"
			},
			{
				"resolver": "number",
				"type": {
					"name": "number",
					"isArray": false,
					"length": 1
				},
				"alias": "number"
			}
		]
	}