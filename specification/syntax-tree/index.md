---
layout: page
title: Syntax tree
---

| Property	 | Type   	 | Description						|
| ------------ | ----------- | -------------------------------------------------- |
| parser	 | string 	 | Name of parser that generated the syntax tree 	|
| formatter	 | string 	 | Format specifier of the result			|
| cardinality  | string 	 | Denotes if result is a single object or array	|
| count	 | number 	 | Total number of items in the result			|
| nodes	 | array[node] | Node collection						|
{: class="table"} 	

###Node

| Property | Type   	      | Description							|
| -------- | ------------- | ------------------------------------------------------ |
| key	    | string 	      | Identifier of node						|
| alias    | string 	      | Friendly name of node					|
| data     | array[object] | Additional metadata for specific generation		|
| nodes    | array[node]   | Node collection						|
{: class="table"} 