*** Settings ***
Library     Collections
Library     XML
Library     os
Library    RequestsLibrary

*** Variables ***
${base_url}    https://restful-booker.herokuapp.com

*** Test Cases ***
Validate data from xml response:
        Create Session      mysession   ${base_url}
        ${response}=    GET On Session    mysession

        ##convert response in to string first
        ${xml_string}=      Convert To String    ${response}
         #convert string into xml object using parse
        ${xml_object}=      Parse Xml    ${xml_string}
        ## check single elemnt value
        Element Text Should Be    ${xml_object}    15       ..//ID
        
        ##multiple values in xml
        ${child_elements}=  Get Child Elements    ${xml_object}
        Should Not Be Empty    ${child_elements}

         Should Not Be Empty    ${child_elements}
        ##get values from child elements captured
          ${fname}=   Get Element Text    ${child_elements[0]}
          ${lname}=   Get Element Text    ${child_elements[1]}
          ${title}=   Get Element Text    ${child_elements[2]}
           Should Be Equal    ${fname}    Akash
           Should Be Equal    ${lname}    Kumar
           Should Be Equal    ${title}    Engineering Manager
