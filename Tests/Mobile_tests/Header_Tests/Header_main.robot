*** Settings ***
Documentation   To Verify global search functionality on Mobile page
Resource        ../../../Resources/common.robot
Resource        ../../../Resources/Local_keywords.robot
Resource        ../../../Resources/MobileHeader_page.robot

Variables       ../../../Resources/Common_Variables.yaml

Test Setup      Begin Web Test
Test Teardown   End Web Test

*** Test Cases ***

Confirm redirection of quick links from search suggestions                      #TC 15
    [Documentation]     This is 15th Testcase
    [Tags]  TC15
    Verify redirections of all quick links from search suggestions


Confirm redirection of suggested links from search suggestions                  #TC 16
    [Documentation]     This is 16th Testcase
    [Tags]  TC16
    Verify redirections of suggested links from search suggestions
    

Confirm on clicking arrow on suggested search, text appears in input field      #TC17
    [Tags]  TC17
    Verify Suggestion arrow icon functionality
    

Confirm suggested list appears on entering input in search field                #TC20
    [Tags]  TC20
    Verify suggestion list functionality
    

Confirm on clicking cart icon user redirected to shopping page                  #TC27
    [Tags]  TC27
    Verify MyCart icon redirection with product

    

# robot -d Results/Mobile_Results/Header_Results  Tests/Mobile_tests/Header_Tests/Header_main.robot
# robot -d Results/Mobile_Results/Header_Results -i TC17  Tests/Mobile_tests/Header_Tests/Header_main.robot