*** Settings ***
Resource                            Mobile_PO/Header_PO/RedirectionForHeader.robot
Resource                            Mobile_PO/Header_PO/GlobalSearch.robot
Resource                            Mobile_PO/Header_PO/MyCart_Header.robot


*** Keywords ***

Visit Mobile Header page of Jio.com
    Landing on Mobile Page For Header

Visit Main Page
    Landing on Jio.com

Verify redirections of all quick links from search suggestions
    Quicklinks Redirection

Verify redirections of suggested links from search suggestions
    Suggested links Redirection

Verify Suggestion arrow icon functionality
    Click on Suggestion icon

Verify suggestion list functionality
    Suggestion list functionality

Verify MyCart icon redirection with product
    MyCart icon redirection with product