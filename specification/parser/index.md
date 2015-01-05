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
		"formatter": "json",
		"nodes":
		[
			{
				"resolver": "joe",
				"type": "simple",
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
		"formatter": "json",
		"nodes":
		[
			{
				"resolver": "joe",
				"type": "simple",
				"alias": "joe",
			},
			{
				"resolver": "soap",
				"type": "simple",
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
		"formatter": "json",
		"nodes":
		[
			{
				"resolver": "joe",
				"type": "simple",
				"alias": "name"
			}
		]
	}

###Arrays
Input:

{:class="scissr-syntax"} 
	joe*3

Produces:

	{
		"parser": "scissr",
		"formatter": "json",
		"nodes":
		[
			{
				"type": "array<complex>[3]",
				"alias": "joeArray",
				"nodes":
				[
					{
						"resolver": "joe",
						"type": "simple",
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
		"nodes":
		[
			{

				"type": "array<complex>[3]",
				"alias": "people",
				"nodes":
				[
					{
						"resolver": "joe",
						"type": "simple",
						"alias": "joe"
					},
					{
						"resolver": "soap",
						"type": "simple",
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
		"nodes":
		[
			{
				"resolver": "abc",
				"type": "array<simple>[3]",
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
		"nodes":
		[
			{
				"resolver": "joe",
				"type": "simple",
				"alias": "joe"
			},
			{
				"resolver": "soap",
				"type": "simple",
				"alias": "soap"
			},
			{
				"type": "complex",
				"alias": "child",
				"nodes":
				[
					{
						"resolver": "abc",
						"type": "simple",
						"alias": "abc"
					},
					{
						"resolver": "def",
						"type": "simple",
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
		"nodes":
		[
			{
				"resolver": "joe",
				"type": "simple",
				"alias": "joe"
			},
			{
				"resolver": "soap",
				"type": "simple",
				"alias": "soap"
			},
			{
				"type": "array<complex>[3]",
				"alias": "children",
				"nodes":
				[
					{
						"resolver": "abc",
						"type": "simple",
						"alias": "abc"
					},
					{
						"resolver": "def",
						"type": "simple",
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
		"nodes":
		[
			{
				"resolver": "string",
				"type": "simple",
				"alias": "string"
			},
			{
				"resolver": "number",
				"type": "simple",
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
		"nodes":
		[
			{
				"resolver": "string",
				"type": "simple",
				"alias": "string"
			},
			{
				"resolver": "number",
				"type": "simple",
				"alias": "number"
			}
		]
	}