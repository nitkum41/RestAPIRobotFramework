*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}    https://restful-booker.herokuapp.com

*** Test Cases ***
Create_Booking:
        Create Session    mysession    ${base_url}
        ${booking_date}=    Create Dictionary   checkin=2018-01-01    checkout=2019-01-01
        ${body}=    Create Dictionary   firstname=Jim   lastname=Brown  totalprice=111  depositpaid=true  bookingdates=${booking_date}    additionalneeds=Breakfast
        ${header}=  Create Dictionary   Content-Type=application/json
        ${response}=    Post Request    mysession    /booking   data=${body}    headers=${header}

        Log To Console    ${response.status_code}
        Log To Console    ${response.content}

        ##validations
        
        ${status_code}=     Convert To String    ${response.status_code}
        Should Be Equal    ${status_code}    200

        ${res_body}=   Convert To String   ${response.content}
        Should Contain    ${res_body}    Ji



*** Keywords ***