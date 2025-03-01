*** Settings ***
Library    RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     os

*** Variables ***
${base_url}    https://restcountries.com/v3.1

*** Test Cases ***
Countries information
    Create Session  mysession   ${base_url}
    ${response}=     GET On Session    mysession    /name/india

    ##covert data to json
#   ${response.json()}
    ## single value from json using jsdon_path
    ${country_name}=    Get Value From Json    ${response.json()}    $[0].name.common
    
    Should Be Equal    ${country_name}[0]    India

   ##list of values
    ${borderr}=     Get Value From Json    ${response.json()}    $[0].borders[3]
    Log To Console    ${borderr}
    Should Be Equal    ${borderr}[0]   CHN


    ##list of values
    ${borders}=     Get Value From Json    ${response.json()}    $[0].borders
    Log To Console    ${borders}[0]
    Should Contain Any    ${borders}[0]   CHN   BGD     PAK

    Should Not Contain Any  ${borders}[0]   USA    UAE