*** Settings ***
Library                              SeleniumLibrary



*** Keywords ***
Landing on Mobile Page For Header
    Visit Jio.com And Goto                             ${Mobile}     
    URL Validation                                     https://www.jio.com/mobile.html
    Set Screenshot Directory                           ./Results/Mobile_Results/Header_Results/Header_Sc/
    Take Screenshot                                    MobilePage_Header_Loaded

Landing on Jio.com
    Visit Jio.com
    Set Screenshot Directory                           ./Results/Mobile_Results/Header_Results/Header_Sc/