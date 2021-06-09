*** Settings ***
Documentation       Test suite Validate finiding item which has cheapest price and place order
Resource            Resources/UserInterface.robot
Library             UtilityLibrary
Library             String
Variables           Pages/ProductPage.py
Variables           Pages/SearchPage.py


*** Keywords ***
Provided precondition
    Setup system under test

*** Test Cases ***
TC:01:Validate title of the page
  [Documentation]    Perform navigation to the url and get the title of the browser opened
  Navigate to the url   chrome   http://automationpractice.com/index.php
  ${title}=   Get Title
  Should Be Equal as strings   ${title}   My Store

TC:02:Validate the Search Functionality
  [Documentation]    Perform search and validate results
  Perform Search   Printed Summer Dress
  ${header_text}=   Get the page haeder of the search
  Should Be Equal as strings   ${header_text}   "PRINTED SUMMER DRESS"

TC:03:Validate the cheapest price item got selected
  [Documentation]    Perform and validate selection of the cheapest price item from the list of items
  ${location}   ${title}=   Get the webelement location of a chepeast price item
  Click Element   xpath=${location}
  ${asserted_value}=   Get Text    ${PRODUCT_NAME}
  Should Be Equal as Strings   ${title}   ${asserted_value}

TC:04:Validate the item quantity changed from 1 to 2
  [Documentation]    Perform and validate changing the quantity of the selected item
  ${before_value}=   Get Text Before clicking plus icon
  ${After_value}=    Get Text After clicking on plus icon
  Should Be Equal As Integers   ${After_value}   2

TC05:Validate item size has been modified
   [Documentation]     Perform and validate the size change of the selected item
   ${size_selected}=   Select a value from a size dropdown list   M
   Should Be Equal as Strings   ${size_selected}   M

TC:06:Change the selected item colour to Green
   [Documentation]    Perform and validate the colour change
   Select the color    Green
   sleep   5sec
   ${color_selected}=   Get Element Attribute    xpath=${COLOUR_SELECTED}   name
   Should Be Equal as Strings   ${color_selected}   Green

TC:07:Validate item has been added to cart
   [Documentation]    Perform click on add to cart button and validate cart
   Click on Add to Cart button

TC:08:Validate the checkout
  [Documentation]     Perform and validate proceed to checkout
  Click on Checkout Button
  ${title}=   Get Title
  Should Be Equal As Strings   ${title}   Order - My Store

TC:09:Validate the total price
  [Documentation]     Perform and validate the total price
  ${value}=   Get the total price
  Should be Equal   ${value}   $34.80

CloseDown
  [Documentation]    Perform the logout and close Browser function.
  Close Browser
