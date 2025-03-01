*** Settings ***
Library    RequestsLibrary
Library     Collections


*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com/

*** Test Cases ***

TestHeaders
    Create Session    mysession    ${base_url}
    ${response}=    GET On Session  mysession       /photos
    
    Log To Console    ${response.headers} #it is a dictionary

    ${content_value}=   Get From Dictionary    ${response.headers}    Content-Type

    ${content_encoding}=   Get From Dictionary    ${response.headers}    Content-Encoding
    
    Should Be Equal    ${content_value}    application/json; charset=utf-8

    Should Be Equal    ${content_encoding}      gzip

TestCookies
    Create Session    mysession    https://app.uat-entauth.idfcfirstbank.com
    ${response}=    GET On Session  mysession       /api/session-transfer/healthz

    Log To Console    ${response.cookies}  ##it is a dictionary of all the cookies
    
    #get one cookie form response using cookie name
    ${cookie_value}=   Get From Dictionary    ${response.cookies}    TS015bc78c

    Log To Console    ${cookie_value}


