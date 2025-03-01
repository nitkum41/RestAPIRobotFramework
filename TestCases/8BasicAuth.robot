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