*** Settings ***
Resource                            Apps_PO/Apps_redirection.robot
Resource                            Apps_PO/Get_now.robot
Resource                            Apps_PO/Page_verification.robot
Resource                            Apps_PO/window_size.robot
Resource                            Apps_PO/Know_More.robot



*** Keywords ***
Visit Apps Page on Jio.com 
    Landing on Apps Page
    Tab Verification

Apps Page Validation
    Page Verification

Apps Banner Validation
    Apps Banner Redirection

Validating App Tiles
    Tile Verification

Check Page Adaptability
    Adjust Window Size

Get Now Button Validation
    Validate Get Now Button

Know More Button Redirection
    Apps Info Page Redirection
      
App Info Page Validation    
    Validate App Info Page



