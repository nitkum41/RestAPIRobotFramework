*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections

*** Test Cases ***
TC1: Readin json from file
    ##load from file
    ${json_obj}=    Load Json From File    data.json

    #store in list
    ${name_list}=   Get Value From Json    ${json_obj}    $.firstName
     Log To Console    ${name_list}[0]

     Should Be Equal    ${name_list}[0]    John

     #nested object
    ${street_add}=   Get Value From Json    ${json_obj}    $.address.streetAddress
     Log To Console    ${street_add}[0]
     Should Be Equal    ${street_add}[0]    naist street

    ##array
     ${phone_number}=   Get Value From Json    ${json_obj}  $.phoneNumbers[0].number

     Log To Console    ${phone_number}[0]
     Should Be Equal    ${phone_number}[0]    0123-4567-8888
