*** Settings ***
Library                              SeleniumLibrary



*** Keywords ***

Quicklinks Redirection
    Visit Mobile Header page of Jio.com
    Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
    Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
    Take Element Screenshot             xpath=//div[@class="pkv-searchresult-section-inner"]      Search_Expanded
    @{suggestions}=                     Get WebElements                     xpath=//li[@class="pkv-searchresult-item"]
    ${len}=                             Get Length                          ${suggestions}
    Log To Console                      ${len}

    FOR     ${i}    IN RANGE    1  ${len}+1
        ${text}=                            Get Text                   (//li[@class="pkv-searchresult-item"]//div[@class="item-text j-text-body-xs"])[${i}]
        ${search_url}                       Get Element Attribute      xpath=//a[contains(@onclick,'${i}')]         href 
        Wait For And Click element          (//li[@class="pkv-searchresult-item"])[${i}]
        Sleep                               1.5s
        Take Screenshot                     quicklink_${text}
        Log To Console                      quicklink_${text} : ${search_url} Page Verified
        Sleep                               1.5s
        Visit Jio.com And Goto              ${Mobile}
        Wait for and Verify Element         xpath=//input[contains(@onclick,"Search")]
        Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
        Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
        Sleep                               0.5s
        
    END

Suggested links Redirection
    Visit Mobile Header page of Jio.com
    Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
    Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
    @{suggestions}=                     Get WebElements                     xpath=//li[@class="pkv-searchresult-item static-suggestion"]
    ${len}=                             Get Length                          ${suggestions}
    Log To Console                      ${len}
    
    FOR     ${i}    IN RANGE    1  ${len}+1
        ${text}=                            Get Text                   xpath=(//li[@class="pkv-searchresult-item static-suggestion"]//div[@class="item-text j-text-body-xs"])[${i}]
        ${search_url}                       Get Element Attribute      xpath=//a[contains(@onclick,'${i}')]         href
        Wait For And Click element          xpath=(//li[@class="pkv-searchresult-item static-suggestion"])[${i}]
        Sleep                               1.5s
        Take Screenshot                     suggested_${text}
        Log To Console                      suggested_${text} : ${search_url} Page Verified
        Sleep                               1.5s
        Visit Jio.com And Goto              ${Mobile}
        Wait for and Verify Element         xpath=//input[contains(@onclick,"Search")]
        Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
        Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
        Sleep                               0.5s

    END


Click on Suggestion icon
    Visit Mobile Header page of Jio.com
    Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
    Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
    Wait For And Click element          xpath=(//span[@class="arrow-suggest"])[${1}]
    ${keyword}                          Get Element Attribute       xpath=//input[@id="topnav-search"]     value
    Log To Console                      ${keyword}
    Take Screenshot                     ${keyword}_selected
    Sleep                               0.5s
    Wait For And Click element          xpath=(//span[@class="arrow-suggest"])[${2}]
    ${keyword}                          Get Element Attribute       xpath=//input[@id="topnav-search"]     value
    Log To Console                      ${keyword}
    Take Screenshot                     ${keyword}_selected
    Sleep                               0.5s


Suggestion list functionality
    Visit Mobile Header page of Jio.com
    Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
    Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
    Wait For And Input Text             xpath=//input[@id="topnav-search"]     Jio
    Take Screenshot                     Jio_keyword_input
    Sleep                               0.5s
    Wait for and Verify Element         xpath=//div[@id="suggested-list-id"]
