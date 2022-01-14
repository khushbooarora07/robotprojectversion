*** Settings ***

Suite Setup    Log    i am inside testsuite setup
Suite Teardown    Log    I am inside testsuite teardown    
Test Setup    Log    I am inside testcase setup    
Test Teardown    Log    I am inide testcase teardown    

Default Tags    sanity    

Library    SeleniumLibrary      
 
*** Test Cases ***

FIRSTTESTCASE
    [Tags]    smoke
    Log    hello 
    
SecondTestCases
    Log    2nd test passed    
    
ThirdTestCase
    Log    3rd test passed 
    Set Tags    testing tag
    #Remove Tags    testing tag
    

FirstSeleniumTestCase    
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text   name=q    automation step by step 
    Press Keys    name=q    ENTER   
    # Click Button    name=btnK        
    Sleep    2    
    Close Browser
    Log    test completed  
    

SampleLoginTest
    [Documentation]    this is  sample login test 
    LOGINKW
      
    Click Element    id=welcome    
    Click Element    link=Logout
    Close Browser
    Log    this test ${TEST NAME} was executed by %{username} on the %{os}
    

*** Variables ***

#scalar var
${URL}    https://opensource-demo.orangehrmlive.com/
    
#List Var

@{credentials}    Admin    admin123

#dictionary variable

&{LoginData}    username=Admin    password=admin123
    

*** Keywords ***

LOGINKW    
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    Input Text    id=txtUsername    ${credentials}[0]
    Input Password    id=txtPassword    ${LoginData}[password]
    Click Button    id=btnLogin 
    