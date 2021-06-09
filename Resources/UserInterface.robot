*** Settings ***
Library           SeleniumLibrary
Variables         Pages/HomePage.py
Variables         Pages/SearchPage.py
Variables         Pages/ProductPage.py
Variables         Pages/OrderPage.py
Library           Collections



*** Keywords ***

Navigate to the url
    [Documentation]  Open browser
    [Arguments]   ${browser}    ${url}
    Open Browser    ${url}    ${browser}
    Set Window Size   width=1920   height=1080

Perform Search
    [Arguments]   ${text}
    [Documentation]    Perform search on the text entered in search area
    Wait Until Element Is Visible   xpath=${SEARCH_TEXT_AREA}   timeout=5sec
    Input Text   xpath=${SEARCH_TEXT_AREA}   ${text}
    Wait Until Element Is Visible   xpath=${SEARCH_BUTTON}   timeout=5sec
    Click Button   xpath=${SEARCH_BUTTON}

Get the page haeder of the search
    [Documentation]    Get the Page Header of the search performed
    Wait Until Element Is Visible   xpath=${SEARCH_PAGE_HEADER}   timeout=5sec
    ${header}=   Get Text     xpath=${SEARCH_PAGE_HEADER}
    [Return]   ${header}

Replace Variable Data
    [Arguments]    ${sourceMessage}    ${replaceData}
    [Documentation]    This function will replace the FIRST set of Characters ~~~ within the passed data.
    ${rtnData}=    Replace String    ${sourceMessage}    ~~~    ${replaceData}    1
    [Return]    ${rtnData}

Get the webelement location of a chepeast price item
   [Documentation]    Get the Cheap price item web element location and title of the item
    Wait Until Element Is Visible    xpath=${PRODUCT_PRICE}
    sleep   5sec
    ${value}=   Get Webelements   xpath=${PRODUCT_PRICE}
    @{l}=   Create List
    FOR  ${index}   IN   @{value}
        ${text}=   Get Text   ${index}
        Append To List   ${l}   ${text}
    END
    Sort List   ${l}
    ${min}=    Set Variable   ${l}[0]
    ${cheap_price_location}=   Replace Variable Data   ${PRODUCT}   ${min}
    ${cheap_price_title_location}=   Replace Variable Data   ${PRODUCT_TITLE}   ${min}
    ${cheap_price_item_title}=    Get Element Attribute     ${cheap_price_title_location}   title
    [Return]   ${cheap_price_location}     ${cheap_price_item_title}

Get Text Before clicking plus icon
   [Documentation]  Get the value in the webelement location
   Wait Until Element Is Visible   xpath=${QUANTITY_WANTED}
   ${value}=   Get Element Attribute    xpath=${QUANTITY_WANTED}   value
   [Return]   ${value}

Get Text After clicking on plus icon
   [Documentation]  Get the value in the webelement location
   Wait Until Element Is Visible   xpath=${PLUS_ICON}
   Click Element   xpath=${PLUS_ICON}
   Wait Until Element Is Visible   xpath=${QUANTITY_WANTED}
   ${value}=   Get Element Attribute    xpath=${QUANTITY_WANTED}   value
   [Return]   ${value}

Select a value from a size dropdown list
  [Documentation]    Select a value in the dropdown by label
  [Arguments]   ${label}
   Wait Until Page Contains Element   xpath=${SIZE_DROPDOWN}   20sec
   Select From List By Label   xpath=${SIZE_DROPDOWN}   ${label}
   ${value}=   Get Selected List Label   xpath=${SIZE_DROPDOWN}
   [Return]   ${value}

Select the color
  [Documentation]    Perform color selection
  [Arguments]   ${COLOR}
  ${xpathData}=    Replace Variable Data   ${COLOUR_SELECT}   ${COLOR}
  Wait Until Element Is Visible   xpath=${xpathData}
  Click Element   xpath=${xpathData}


Click on Add to Cart button
  [Documentation]     Perform click on Add to Cart Button and wait for the success message
  Wait Until Element Is Visible   xpath=${ADD_TO_CART}
  Click Element  xpath=${ADD_TO_CART}
  Sleep    15sec
  Wait Until Element Is Visible   xpath=${SUCCESS_MESSAGE}

Click on Checkout Button
  [Documentation]    Perform click on Proceed to checkout button and wait for the header
  Wait Until Element Is Visible   xpath=${CHECK_OUT}
  Click Element   xpath=${CHECK_OUT}
  Sleep   5sec
  Wait Until Element Is Visible   xpath=${SUMMARY_HEADER}

Get the total price
  [Documentation]    Get the total price from the order screen
  Wait Until Element Is Visible   xpath=${TOTAL_PRICE}
  ${value}=   Get Text   xpath=${TOTAL_PRICE}
  [Return]   ${value}






