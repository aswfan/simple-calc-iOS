## This is 6nd assignment for INFO 449: Mobile Development: IOS (Spring 2017)

Date: Apr. 18 - 25, 2017

### Requirements:

- __Name:__ SimpleCalc-iOS Version 1

Date: Apr. 18, 2017

  - classic "text field and buttons" display

    - ten digit buttons (0, 1, 2, ... 9)

    - operations add, sub, mul, div, mod, equals button
      
      when user enters number, then operation, then number, then equals, calculate result

  - Add a few new (multi-operand) operations in

    - "count": count the number of input
      
      ` 10 count 4 count 25 equals => 3 `

    - "avg": average all the inputs

      ` 2 avg 4 avg 6 avg 8 avg 10 equals => 6 `

    - "fact": calculate factorial
      ` 5 fact => 60 `
      
      fact can only accept one number

  - Details

    - call this "simple-calc"

    - iPhone 4.7-inch app (iPhone 6 screen), iOS 8 or 9

    - only changes should be to Main.storyboard and ViewController.swift


- __Name:__ SimpleCalc-iOS Version 2

Date: Apr. 25, 2017

  - extending the previous version

  - support any screen size

    UI should look "more or less" the same across differnt devices

    meaning, buttons in roughly the same place, same relative size, etc

    in other words, use AutoLayout to create a generic display

  - support rotating the device
  
    be able to use the device in any orientation without losing state

  - show a "history" view
  
    segue to a new screen that contains a UIScrollView

    this should in turn contain UILabels as children

    each label should have a "history" of the most recent calculations

    display as ` 2 + 2 = 4" "4 / 4 = 1 `, and so on

    have a button to return to the main display


