*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${baseurl}      https://gorest.co.in
${token}    Bearer 57c7064a963854558945c9e6533dff5b8e090eca72463268c9ce438bd7ac5228

*** Test Cases ***
TC1:return all users
    Create Session    usersession    ${baseurl}
    ${header}=  Create Dictionary       Content-Type=application/json   Authorization=${token}
    ${response}=    GET On Session    usersession    /public/v2/users       headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200

TC2:create new user
    Create Session    usersession    ${baseurl}
    #create a dictionary for request body
    ${body}=    Create Dictionary       name=akrishna    gender=male  email=amaftg123@gmail.com   status=active

    ${header}=  Create Dictionary       Content-Type=application/json   Authorization=${token}

    ${response}=    POST On Session     usersession     /public/v2/users    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ##validations
    Should Be Equal As Integers    ${response.status_code}    201

    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    amaftg123

TC3:get user based on id
    Create Session    usersession    ${baseurl}
    ${header}=  Create Dictionary       Content-Type=application/json   Authorization=${token}
    ${response}=    GET On Session    usersession    /public/v2/users/7732618       headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Should Be Equal As Integers    ${response.status_code}    200
    
    ${res_body}=  Convert To String    ${response.content}
    
    Should Contain    ${res_body}    Chandraketu Butt

TC5: update existing record
    Create Session    usersession    ${baseurl}
    #create a dictionary for request body
    ${body}=    Create Dictionary       name=Ramakrishna    gender=male  email=krishnagopal123@gmail.com   status=inactive

    ${header}=  Create Dictionary       Content-Type=application/json   Authorization=${token}

    ${response}=    PUT On Session     usersession     /public/v2/users/7732591    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ##validations
    Should Be Equal As Integers    ${response.status_code}    200

    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    krishnagopal123@gmail.com

TC5: delete an user
    Create Session    usersession    ${baseurl}
    ${header}=  Create Dictionary       Content-Type=application/json   Authorization=${token}

    ${response}=    DELETE On Session    usersession     ${baseurl}/public/v2/users/7732539
    Log To Console    ${response}
    ##validations
    Should Be Equal As Integers    ${response.status_code}    204