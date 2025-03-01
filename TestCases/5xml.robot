*** Settings ***
Library     Collections
Library     XML
Library     os

*** Test Cases ***
Read data from xml file:

    ##load xml data
    ${xml_object}=  Parse Xml    data.xml

    ##validation  ##single element value
    ## METHOD 1 get element text of the xpath
    ${first_name}=  Get Element Text    ${xml_object}       .//employee[1]/firstname
    Log To Console    ${first_name}
    Should Be Equal    ${first_name}    Jitendra

    ### METHOD 2 get element

    ${first_name}=  Get Element   ${xml_object}       .//employee[1]/firstname
    Log To Console    ${first_name}
    #get text from the element
    Should Be Equal    ${first_name.text}    Jitendra

    ##method 3: directly in one line
    Element Text Should Be    ${xml_object}    Jitendra     .//employee[1]/firstname


    ## no of elements (nodes)

    ${totlemployees}=  Get Element Count    ${xml_object}      .//employee

    Should Be Equal As Integers    ${totlemployees}    9

    ## check attribute present in xml or not

    Element Attribute Should Be    ${xml_object}    id    be130     .//employee[2]
    
    
    ###check values of child elements
    ${child_elements}=  Get Child Elements    ${xml_object}     .//employee[3]
    
    Should Not Be Empty    ${child_elements}
    ##get values from child elements captured
    ${fname}=   Get Element Text    ${child_elements[0]}
    ${lname}=   Get Element Text    ${child_elements[1]}
    ${title}=   Get Element Text    ${child_elements[2]}
   Should Be Equal    ${fname}    Akash
   Should Be Equal    ${lname}    Kumar
   Should Be Equal    ${title}    Engineering Manager
    