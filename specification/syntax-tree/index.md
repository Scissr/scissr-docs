---
layout: page
title: Syntax tree
---

###Root

| Property | Type | Required | Default | Description |
|-|-|-|-|-|
| parser | `string` | yes | scissr | Name of parser that generated the syntax tree |
| formatter | `string` | yes | json | Format specifier of the result |
| data | `object[]` | no || Additional metadata for specific generation |
| nodes | `node[]` | yes || Node collection |
{: class="table"} 	

###Node

| Property | Type | Required | Default | Description |
|-|-|-|-|-|
| resolver | `string` | no || Value resolver |
| type     | `nodeType` | yes || Type of node |
| alias    | `string` | yes      || Friendly name of node |
| data     | `object[]` | no || Additional metadata |
| nodes    | `node` | no || Node collection |
{: class="table"} 

###NodeType

| Property | Type | Required | Default | Description |
|-|-|-|-|-|
| name | `string` | yes || Name of type. Can be: `object`,`string`,`bool`,`int`,`number`,`date`             |
| isArray | `bool` | yes | false | Denotes if type is an array |
| length | `int` | yes | 1 | Length of array, if applicable |
{: class="table"} 