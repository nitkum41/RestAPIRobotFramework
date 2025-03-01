*** Settings ***
Library    RequestsLibrary
Library     Collections


*** Variables ***
${base_url}    https://restful-booker.herokuapp.com
${id}   1



*** Test Cases ***
Get_Booking
    Create Session  mysession   ${base_url}

   # ${response}=     Get Request    mysession    /booking/${id}

   ${response}=     GET On Session    mysession    /booking/${id}

     log to console  ${response.status_code}
     log to console  ${response.content}
     log to console  ${response.headers} # it is a dictionary

     ##VALIDATIONS
    ${status_code}=     Convert To String     ${response.status_code}
    
    Should Be Equal    ${status_code}    200
    
    
    ${body}=    Convert To String    ${response.content}
    
    Should Contain    ${body}    Mark

    ${value}=   Get From Dictionary    ${response.headers}    Content-Type

    Should Be Equal    ${value}    application/json; charset=utf-8


*** Keywords ***


