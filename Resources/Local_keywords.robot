*** Settings ***
Library                             SeleniumLibrary


*** Keywords ***
Pop-Up Verification
    [Arguments]      ${Title}
    #Close Button
    Wait For And Verify Element             xpath=//button[contains(@onclick,'close')]
    #Rupees Symbol
    Wait For And Verify Element             xpath=//div[@class='input-info-wrapper']//span[@class='j-icon j-icon__bg']//*[name()='svg']
    #Toggle Button
    Wait For And Verify Element             xpath=//div[contains(@class,'jds-tabs jds-tabs-filled jds-tabs-radius jds-tabs-icon modal-jds-tabs')]

    IF  "${Title}" == "Quick Recharge"

        ${Status}=         Run Keyword And Return Status   Wait For And Verify Element     xpath=//a[@aria-controls="mobile"][@aria-selected="true"]
        #Mobile & Fiber Tab
 
        IF  ${Status} == True
        #Quick Recharge sub-title
            Text Verification                xpath=//div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']  Enter your Jio number
            #Enter Mobile Number
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'Mobile')]  Mobile Number
            Wait For And Click Element       xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
            Text Verification                xpath=//div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']  Enter your JioFiber number
            #Enter JioFiber Number
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'JioFiber')]  JioFiber Number
            #i button
            Wait For And Verify Element     xpath=//span[@data-popup-open='modal-info']
            Wait For And Click Element       xpath=//a[@aria-controls="mobile"][@aria-selected="false"]
            END 
    ELSE IF  "${Title}" == "Pay Bill"

        ${Status}=         Run Keyword And Return Status   Wait For And Verify Element     xpath=//a[@aria-controls="mobile1"][@aria-selected="true"]
        #Mobile & Fiber Tab
        IF  ${Status} == True

            #Quick Recharge sub-title
            Text Verification                xpath=//div[@class="j-contentBlock__content"]//div[contains(normalize-space(),"Paying bills")]  Paying bills was never this easy
            #Enter Mobile Number
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'Mobile')]  Mobile Number            
            Wait For And Click Element       xpath=//a[@aria-controls="fiber1"][@aria-selected="false"]
            #Enter JioFiber Number
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'JioFiber')]  JioFiber Number
            #i button
            Wait For And Verify Element     xpath=//span[@data-popup-open='modal-pb-info']
        END
        #Rupaye symbol in Amount field  
        Wait For And Verify Element         xpath=//span[@class="input-icon input-icon-prefix clickable"]
        #Enter Amount
        Text Verification                   xpath=//label[@class='field-label' and contains(text(),'Am')]  Amount
        Wait For And Click Element          xpath=//a[@aria-controls="mobile1"][@aria-selected="false"]
    ELSE 
        Log  Random Popup
    END
    #Continue,View Bill Summary button
    ${buttons}=     Get WebElements     xpath=//button[contains(@class,'btn-disabled')]
    FOR  ${button}  IN  @{buttons}
        Button Verification         ${button}
    END

Check Buttons Enabled
    [Arguments]     ${name_locator}     ${name}   ${number_locator}     ${number}   ${Bt_locator}      
    Element Should Be Disabled          ${Bt_locator}
    Wait For And Click Element          ${name_locator}
    Wait For And Input Text             ${name_locator}         ${name}
    Sleep   200ms
    Wait For And Click Element          ${number_locator}
    Wait For And Input Text             ${number_locator}       ${number}
    Sleep   200ms
    Element Should Be Enabled           ${Bt_locator}    

Cross Button Functionality
   [Arguments]      ${locator}
    Wait For And Verify Element      ${locator}
    Sleep    100ms
    Wait For And Click Element       ${locator}
    Sleep    100ms

Check Continue Button Enabled
    [Arguments]     ${text_locator}     ${locator}      ${text}
    Element Should Be Disabled      ${locator}
    Wait For And Click Element      ${text_locator}
    Sleep   200ms
    Wait For And Input Text         ${text_locator}     ${text}
    Sleep   200ms
    Element Should Be Enabled       ${locator}

Enter Number and Proceed
    [Arguments]        ${Txt_locator}   ${Number}   ${Contine_Button}
    Sleep               1s
    Wait For And Input Text             ${Txt_locator}       ${Number}
    Wait For And Click Element          ${Contine_Button}
    Sleep                               600ms


Paybill Tab Validation
    [Arguments]         ${Number}
    #Check Cross Button is not visible
    Wait Until Element Is Not Visible   xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Wait Until Element Is Not Visible   xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    #Check Continue Button Enabled or not
    Check Continue Button Enabled                xpath=//input[@id='paybill-user-number']                xpath=//button[contains(@class,'btn-disabled')][1]        ${Incorrect_No1}
    Check Continue Button Enabled                xpath=//input[@id='paybill-user-amount']                xpath=//button[contains(@class,'btn-disabled')][2]        100 
    
    #Invalid Number Verification
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][1]
    Text Verification                   xpath=//div[@id='dyn-sendotp-paybill-geninvalid']                  Please enter a valid Jio number/Service ID  
    #Clear Textfield
    Cross Button Functionality          xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Cross Button Functionality          xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    #Prepaid Number Verification
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number} 
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2] 
    Text Verification                   xpath=//div[@id='dyn-submitamt-paybill-geninvalid']                 You have entered a prepaid Jio number.

Need Guidance Section Validation
   #Scroll Down                               xpath=//section[@class="j-container bg--primary-background"]
   Wait For And Verify Element               xpath=//section[@class="j-container bg--primary-background"]
   Take Element Screenshot                   xpath=//section[@class="j-container bg--primary-background"]            NeedGuidance
   ${Inc}  Set Variable   0
   #Need Guidance Text Verification
   Text verification             xpath=//section[@class="j-container bg--primary-background"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]                      Need guidance?
   #We’d love to help you. Text Verification
   Text verification             xpath=//section[@class="j-container bg--primary-background"]//div[@class="j-contentBlock__description j-text-body-m j-color-primary-grey-80"]    We’d love to help you.
   #Support Button Text Verification
   ${Buttons}=      Get WebElements      xpath=//button[@class="j-button j-button-size__medium secondary icon-primary icon-primary-inline j-button-flex "]
   FOR  ${Button}  IN  @{Buttons}
      Text verification    ${Button}   ${Button_Name}[${Inc}]
      ${Inc}=   Evaluate       ${Inc} + 1   
   END
    

   #Support Button Redirection Check
   ${VB}  Set Variable   0
   WHILE  ${VB} < 4
      Redirection On Clicking     xpath=//div[@class='j-button-group btn_fullwidth_icon']//button[@aria-label='${Button_Name}[${VB}]']   ${UrlList}[${VB}]    ${Button_Name}[${VB}]  
      ${VB}=   Evaluate     ${VB} + 1
   END

   
More Information Section Redirection
    [Arguments]         ${Button_locator}   ${title}
    ${elements}=      Get WebElements    ${Button_locator}
    FOR  ${element}  IN  @{elements}
        IF  "${title}" == "ISD"
            ${Bname}=    Get Text           ${element}
            Open Popup                      ${element} 
            Take Screenshot                 ${title}_${Bname} 
            IF  "${Bname}" == "Store Offer"
                Close Popup     xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//span
            ELSE 
                Close Popup     xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//button
            END
        ELSE IF  "${title}" == "In-Flight Packs"
            ${Bname}=    Get Text    ${element}
            IF  "${Bname}" == "In-Flight service T&C"
                Wait For And Click Element  ${element}
                Change Tab                  Terms & Conditions - In-Flight Service
                Take Screenshot             ${title}_${Bname}
                Change Tab                  Prepaid Recharge Plans - Online Prepaid Mobile Recharge | Jio     
            ELSE
                Open Popup    ${element} 
                Take Screenshot            ${title}_${Bname} 
                Close Popup     xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//button
            END
        ELSE IF  "${title}" == "International Roaming"
            ${Bname}=    Get Text    ${element}
            IF  "${Bname}" == "Standard PayGo Rates"
                Wait For And Click Element  ${element}
                Change Tab                  IR-Standard-PayGo-Rates.pdf
                Take Screenshot             ${title}_${Bname}
                Change Tab                  Best Jio International Roaming Plans     
            ELSE IF  "${Bname}" == "International WiFi Calling T&C"
                Wait For And Click Element  ${element}
                Change Tab                  International Wi-Fi Calling - Terms & Conditions
                Take Screenshot             ${title}_${Bname}
                Change Tab                  Best Jio International Roaming Plans
            ELSE IF  "${Bname}" == "IR Plans T&C"
                Wait For And Click Element  ${element}
                Change Tab                  International Roaming - Terms & Conditions
                Take Screenshot             ${title}_${Bname}
                Change Tab                  Best Jio International Roaming Plans
            ELSE
                Open Popup    ${element} 
                Take Screenshot            ${title}_${Bname} 
                IF  "${Bname}" == "Store Offer"
                    Close Popup     xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//span
                ELSE 
                    Close Popup     xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//button
                END
            END
        
        ELSE
            ${Bname}=    Get Text    ${element}
            IF  "${Bname}" == "Plan Vouchers"
                Wait For And Click Element  ${element}
                Switch Window       NEW
                Sleep               4s
                Take Screenshot             ${title}_${Bname}
                Change Tab                  Prepaid Recharge Plans - Online Prepaid Mobile Recharge | Jio  
             ELSE
                Open Popup    ${element} 
                Take Screenshot            ${title}_${Bname} 
                IF  "${Bname}" == "Store Offer"
                    Close Popup     xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//span
                ELSE 
                    Close Popup     xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//button
                END
            END
        
        END
        
    END