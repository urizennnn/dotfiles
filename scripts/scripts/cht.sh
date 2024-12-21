#!/bin/bash

topic_constraint=***REMOVED***none***REMOVED***

while [[ ***REMOVED***$#***REMOVED*** -gt 0 ]];do
case $1 in
  l|lang) 
  topic_constraint=***REMOVED***lang***REMOVED***
  shift;;
***REMOVED***
done

topic=***REMOVED******REMOVED***
if [[ ***REMOVED***$topic_constraint***REMOVED*** == ***REMOVED***lang***REMOVED*** ]]; then
  topic=$(printf ***REMOVED***go\nrust\nc***REMOVED*** | fzf) 
  stty sane
***REMOVED***
  topic=$(curl -s cht.sh/:list | fzf)
  stty sane
***REMOVED***

if [[ -z ***REMOVED***$topic***REMOVED*** ]]; then
  exit 0
***REMOVED***

sheet=$(curl -s cht.sh/$topic/:list | fzf)

if [[ -z ***REMOVED***$sheet***REMOVED*** ]]; then
  curl -s cht.sh/$topic?style=rrt | bat 
  exit 0
***REMOVED***

curl -s cht.sh/$topic/$sheet?style=rrt  | bat 
