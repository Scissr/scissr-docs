---
layout: page
title: Syntax tree
---
{% assign special = '{{ example }}' %}
{% assign special = '{{ example }}' %}

| Property     | Type             | Required | Default | Description                                        |
| ------------ | ---------------- | -------- | --------| -------------------------------------------------- |
| parser       | string           | yes      | scissr  | Name of parser that generated the syntax tree      |
| formatter    | string           | yes      | json    | Format specifier of the result                     |
| data         | array of objects | no       |         | Additional metadata for specific generation        |
| nodes        | array of nodes   | yes      |         | Node collection                                    |
{: class="table"} 	

###Node

| Property | Type   	      | Required | Default | Description	            |
| -------- | ---------------- | -------- | ------- | -------------------------- |
| resolver | string 	      | no       |         | Value resolver             |
| type     | nodeType         | yes      |         | Type of node               |
| alias    | string           | yes      |         | Friendly name of node      |
| data     | array of objects | no       |         | Additional metadata        |
| nodes    | array of nodes   | no       |         | Node collection	        |
{: class="table"} 

###NodeType

| Name                    | Description	                                       |
| ----------------------- | -------------------------------------------------- |
| simple                  | Simple type of string, number or date              |
| complex                 | Object type                                        |
| array&lt;nodeType&gt;[] | Array of a specific nodeType with a specific count |
{: class="table"} 