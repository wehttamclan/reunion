# Reunion

## Preparation

1. Fork this repository.
1. Clone your new repository to your local machine.
1. Run `bundle` from the command line.
1. Run `rake` from the command line.

## Synthesis

Included with your pull request, you must submit answers to the following questions:

* What do you think we were trying to get you to learn with this challenge?
* Outline in words (at least 5-6 sentences) what your code is doing in order to solve this problem.
* What was the most difficult portion of this for you?
* What came naturally to you?

## Tasks

We're developing a small application to split expenses after a group of friends get together for a reunion. This will track how much each person spent on a particular activity, how much each person owes across all activities, and ultimately print out a summary of how much each person owes or is owed.

Use tests to drive your development.

### Iteration 1: Creating Activities

Add to the existing Activity class so that it supports the following functionality.

* An Activity has a name
* An Activity has participants
  * participants are represented with a hash and have a name and an amount they've paid for that activity  
* You can add participants to an Activity
* An Activity has two costs:
  * a base cost
  * a cost per participant
* You can evaluate the total cost of an activity

### Iteration 2: Activity Calculations

Add to the Activity class so that it supports the following functionality.

* An Activity can calculate each person's fair share, the total cost of the Activity divided evenly among participants
* An Activity can evaluate out how much each person is owed/owes
  * If a participant paid less than their fair share they owe a positive amount.
  * If a participant paid more than their fair share they owe a negative amount (meaning they are owed money).  

### Iteration 3: Creating Reunions

Add to the existing Reunion class so that it supports the following functionality.

* A Reunion has a location
* A Reunion has Activities  
* You can add Activities to a Reunion

### Iteration 4: Reunion Calculations

Add to the existing Reunion class so that it supports the following functionality.

* You can evaluate the total cost of a Reunion
* You can create a total breakdown of the Reunion which figures out who owes/is owed how much
  * Consider all of the Activities
  * If a participant paid less than their fair share they owe a positive amount.
  * If a participant paid more than their fair share they owe a negative amount (meaning they are owed money).
* You can print a summary of total owed amounts per person


### Iteration 5: ERB

Research ERB. Create a template for a webpage using HTML and ERB that will display important details of a Reunion. Create a runner file to create a Reunion with Activities, and use the template to generate an HTML page that you can open in your browser.
