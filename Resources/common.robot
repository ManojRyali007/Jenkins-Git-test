*** Settings ***
Library                             SeleniumLibrary
Library                             ExcelLibrary
Library                             RequestsLibrary
Library                             String
Library                             Collections

*** Keywords ***
Begin Web Test
    Open Excel Document         filename=Resources/JioWeb.xlsx    doc_id=JioWeb
    Open Browser                about:blank     ${Browser}
    Maximize Browser Window
    

End Web Test
    Close All Excel Documents 
    Close Browser

#Common Keywords 
Visit Jio.com   
    Go To                                ${URL}
    Sleep                                500ms

Visit Jio.com And Goto
    [Arguments]                         ${Page}
    Visit Jio.com
    Wait For And Click Element          ${Page}

Take Screenshot     
    [Arguments]     ${Sc_Name}
    Sleep   300ms
    Capture Page Screenshot         ${Sc_Name}.png  

Take Element Screenshot
    [Arguments]     ${locator}      ${SC_name}
    Sleep   200ms
    Capture Element Screenshot      ${locator}      ${SC_name}.png


Redirection On Clicking
   [Arguments]       ${Button}          ${WebPageURL}    ${Sc_name}
    Scroll Down                         ${Button}                 
    Wait For And Click Element          ${Button}              
    Sleep     1s
    URL Validation                      ${WebPageURL}
    Take Screenshot                     ${Sc_name}
    Go Back
    Log To Console                      ${Sc_name} Redirection Successful

Wait For And Click Element
    [Arguments]                             ${locator}      
    Wait Until Element Is Visible           ${locator}
    Click Element                           ${locator}  
    Sleep   50ms 

Wait For And Input Text
    [Arguments]                             ${locator}     ${text}
    Wait Until Element Is Visible           ${locator}
    Sleep    100ms
    Input Text                              ${locator}     ${text}

Wait For And Verify Content
    [Arguments]                             ${locator}      ${str}
    Wait Until Element Is Visible           ${locator}
    Sleep   200ms
    Element Should Contain                  ${locator}      ${str}


Wait For And Verify Element
    [Arguments]     ${locator}
    Wait Until Element Is Visible           ${locator}
    Wait Until Page Contains Element        ${locator}

URL Validation
    [Arguments]                 ${VURL}
    Sleep  500ms
    Wait Until Location Is      ${VURL}

Image Verification
    [Arguments]                                 ${locator}
    Wait Until Element Is Visible               ${locator}
    Page Should Contain Image                   ${locator}
    ${img src}=     Get element attribute       ${locator}      src
    Create Session      img     ${img src}
    ${resp_google}=   GET On Session  img    ${img src}   expected_status=200
   

Section Verification
    [Arguments]     ${locator}      ${name}
    Scroll Down                     ${locator}
    Wait For And Verify Element     ${locator} 
    Sleep  0.5s
    Log To Console      ${name} Section is Visible

Banner Content Verification
    [Arguments]                     ${Txt_locator}      ${txt}      ${Img_locator}  ${Btn_locator}   ${Scn_Name}
    Text Verification               ${Txt_locator}      ${txt}
    Image Verification              ${Img_locator}
    ${Buttons}=      Get WebElements     ${Btn_locator}
    FOR  ${Button}  IN  @{Buttons}
        Mouse Over                      ${Button}
        Page Should Contain Button      ${Button}
    END    
    Take Screenshot                 ${Scn_Name}
    Log To Console                  ${Scn_Name} Section Content Verified

Change Tab
    [Arguments]     ${title}
    Sleep   100ms
    Switch Window                       title=${title}
    Sleep   100ms

Scroll Down
    [Arguments]                         ${locator}
    Sleep   100ms
    Run Keyword And Ignore Error    Scroll Element Into View            ${locator}

Open Popup
    [Arguments]                                         ${locator}
    Wait For And Click Element                          ${locator}    

Close Popup
    [Arguments]                                         ${cross}
    Wait For And Click Element                          ${cross}

Text Verification
    [Arguments]                             ${locator}          ${title}
    Wait Until Element Is Visible           ${locator}
    Element Text Should Be                  ${locator}          ${title}

CSS Verification
    [Arguments]    ${locator}    ${attribute name}  ${attribute_value}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    Should Be Equal As Strings    ${prop_val}    ${attribute_value}

Banner Redirection
    [Arguments]     ${locator_id}   ${Sc_Name}
    ${visiblity}=   Run Keyword And Return Status   Wait Until Element Is Visible       xpath=//ul[@class='slick-dots']
    IF  ${visiblity} == True
        ${VB}  Set Variable   0
        WHILE  ${VB} < 3
            Wait For And Click Element      xpath=//li[@id='${locator_id}${VB}']
            Wait For And Click Element      xpath=//div[@class="j-fullwidth-banner slick-slide slick-current slick-active"][@aria-describedby="${locator_id}${VB}"]//button[contains(@class,'redirectButton')]
            Sleep  1s
            Take Screenshot                 ${Sc_Name}_BannerRedirection_${VB}
            Log To Console                  ${Sc_Name}_Banner_${VB} Redirection Successful
            Go Back
            ${VB}=   Evaluate     ${VB} + 1
        END
    ELSE
        Wait For And Click Element      ${locator_id}
        Take Screenshot                 ${Sc_Name}_BannerRedirection
        Log To Console                  ${Sc_Name}_Banner_Redirection Successful
        Go Back
    END


Check Filter Button
    Open Popup                      xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
    #UI verification
    Text Verification               xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//h4     Filter
    ${checkboxes}=                  Get WebElements     xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"]
    FOR  ${checkbox}  IN  @{checkboxes}
        Wait For And Verify Element             ${checkbox}
        Checkbox Should Not Be Selected         ${checkbox}
    END

    Wait For And Verify Element         xpath=//section[contains(@class,'desktop')]//button[@aria-label='button'][normalize-space()='Show plans']
    Wait For And Verify Element         xpath=//section[contains(@class,'desktop')]//button[@aria-label='button'][normalize-space()='Clear filter']
    Wait For And Verify Element         xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//header[@class='j-modal-header']//button

    #Filter pop-up Functionality
    ${length}=                          Get Length      ${checkboxes}
    FOR     ${i}    IN RANGE   1  ${length}+1

        Wait For And Click Element          xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//span[2]
        Checkbox Should Be Selected         xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//input
        ${Plan_Name}=       Get Text        xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]
        Wait For And Click Element          xpath=//section[contains(@class,'desktop')]//button[@aria-label='button'][normalize-space()='Show plans']
        Sleep                               1s
        Text Verification                   xpath=//section[contains(@class,'desktop')]//div[@class="Subcategory_heading__3Y18a j-text j-text-heading-m"]       ${Plan_Name}
        Wait For And Click Element          xpath=(//section[contains(@class,'desktop')]//div[@class='Filter_filter__2yX0Z']//button[@class="j-tag active clickable"])[1]
        Sleep                               1s
        Open Popup                          xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
    END
    @{Plan_List}=       Create List

    #All planfilter & Clear button
    FOR     ${i}    IN RANGE   1  ${length}+1

        Wait For And Click Element          xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//span[2]
        Checkbox Should Be Selected         xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//input
        ${Plan_Name}=       Get Text        xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]
        Append To List      ${Plan_List}    ${Plan_Name}
    END
    Log                                 ${Plan_List}
    Wait For And Click Element          xpath=//section[contains(@class,'desktop')]//button[@aria-label='button'][normalize-space()='Show plans']

    ${elements}=                        Get WebElements    xpath=//section[contains(@class,'desktop')]//div[@class="Subcategory_heading__3Y18a j-text j-text-heading-m"]
    ${Plan_count}=                      Get Length      ${elements}
    FOR     ${i}    IN RANGE   0  ${Plan_count}
        Text Verification       ${elements}[${i}]       ${Plan_List}[${i}]
    END

    Open Popup                          xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
    Wait For And Click Element          xpath=//section[contains(@class,'desktop')]//button[@aria-label='button'][normalize-space()='Clear filter']
    FOR  ${checkbox}  IN  @{checkboxes}
        Wait For And Verify Element             ${checkbox}
        Checkbox Should Not Be Selected         ${checkbox}
    END
    
    Close Popup                         xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//header[@class='j-modal-header']//button



Plan Page UI Verification
    [Arguments]                      ${title}  
    Text Verification                xpath=(//h1[@class="Filter_category__2vFb8 j-text j-text-heading-l"])[1]   ${title}
    Wait For And Verify Element      xpath=//section[@class="j-container l-breakpoint--desktop"]//button[contains(text(),'Other Prepaid plans')]  
    ${elements}=    Get WebElements  xpath=(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"])
    ${length}=                          Get Length      ${elements}
    FOR     ${i}    IN RANGE   1  ${length}+1
        Scroll Down     xpath=(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"])[${i}]
        ${packname}=  Get Text          xpath=(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"]//div[contains(@class,"Subcategory_heading")])   
        Wait For And Verify Element    xpath=(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"])[${i}]
        Take Screenshot     ${packname}
    END 
    Wait For And Verify Element      xpath=//section[@class="j-container l-breakpoint--desktop"]//button[contains(text(),'Other Prepaid plans')] 
    Wait For And Verify Element      xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation_more')]
    ${elements}=    Get WebElements  xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'secondary')]
    FOR  ${element}  IN  @{elements}
         Wait For And Verify Element  ${element}
    END



Plan Card Verification
    [Arguments]     ${Sheet_name}    ${Amt_locator}     ${VDBT_locator}     ${Recharge_Button}    ${View_Button}
    FOR  ${i}  IN RANGE  2   20
        ${Amt}=     Get Text    ${Amt_locator}
        ${Amt}=     Replace String    ${Amt}    \n    ${EMPTY}
        ${E_Amt}=   Read Excel Cell          row_num=${i}      col_num=1  sheet_name=${Sheet_name}
        IF  "${Amt}" == "${E_Amt}"
            ${VDBT}=                 Get Text    ${VDBT_locator}
            ${E_VDBT}=    Read Excel Cell          row_num=${i}      col_num=2    sheet_name=${Sheet_name}
            IF  '''${VDBT}''' == '''${E_VDBT}'''
                Should Be Equal    ${VDBT}       ${E_VDBT}
            ELSE
                Log     Details not matched.
            END
        END
    END

    Wait For And Verify Element     ${Recharge_Button}
    Wait For And Verify Element     ${View_Button}
    

View Details Popup Verification
   [Arguments]     ${Sheet_name}   ${View_Button}      ${Amt_locator}      ${Details_locator}      ${OTT_Subs}    ${Cross}   
    Scroll Down     ${View_Button}  
    Wait Until Keyword Succeeds     30sec  1sec  Open Popup  ${View_Button}
    FOR  ${i}  IN RANGE  2   20
        Wait Until Keyword Succeeds     30sec  1sec     Wait For And Verify Element    ${Amt_locator}
        ${Amt}=     Get Text    ${Amt_locator}
        ${Amt}=     Replace String    ${Amt}    \n    ${EMPTY}
        ${E_Amt}=   Read Excel Cell          row_num=${i}      col_num=1  sheet_name=${Sheet_name}
        IF  "${Amt}" == "${E_Amt}"
            Wait Until Keyword Succeeds     30sec  1sec     Wait For And Verify Element    ${Details_locator}  
            ${Details}=                 Get Text    ${Details_locator}
            ${E_Details}=    Read Excel Cell          row_num=${i}      col_num=3    sheet_name=${Sheet_name}
            IF  '''${Details}''' == '''${E_Details}'''
                Should Be Equal    ${Details}      ${E_Details}
                ${presense}=    Run Keyword And Return Status   Element Should Be Visible   ${OTT_Subs}
                IF  ${presense} == True
                    ${elements}=    Get WebElements    ${OTT_Subs}
                    FOR  ${element}  IN  @{elements}
                        Wait For And Verify Element  ${element}
                    END
                ELSE
                    Log     ${OTT_Subs}
                END
            
                ${Hyperlink_presence}=    Run Keyword And Return Status   Element Should Be Visible   ${Details_locator}//a    
                IF  ${Hyperlink_presence} == True
                    ${Newtab}=    Run Keyword And Return Status   Element Attribute Value Should Be      ${Details_locator}//a    target     _blank
                    IF  ${Newtab} == True
                        Wait For And Click Element      ${Details_locator}//a
                        Sleep  200ms
                    ELSE    
                        Wait For And Click Element      ${Details_locator}//a
                        Sleep  200ms
                        Go Back
                    END
                END
            ELSE 
                Log     Details not matched.
            END

        END
    END
    Wait Until Keyword Succeeds     30sec  1sec    Close Popup             ${Cross}



Proceed to payment
    Wait For And Input Text             xpath=//input[@type='tel']      ${MyNumber}
    Sleep                               0.5s
    Wait For And Click Element          xpath=//button[normalize-space()='Continue']


Recharge Popup Verification
    [Arguments]         ${Recharge_locator}      ${Amt_locator}      ${View_Button}
    ${Amt}=             Get Text            ${Amt_locator}
    ${Amt}=             Replace String    ${Amt}    \n    ${EMPTY}  
    ${Plan_URL}=        Get Location                    
    ${presense}=        Run Keyword And Return Status   Wait For And Verify Element  xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]
    #Opening Recharge Popup
    IF  ${presense} == True
        #Open Popup      ${View_Button}
        Open Popup      xpath=//div[contains(@aria-label,'Modal')]//button[@aria-label='button'][normalize-space()='Recharge']

    ELSE  

        Open Popup                          ${Recharge_locator}
        #----------------UI & Content Verification------------------------------------------------#
        #Rupee Logo
        Wait For And Verify Element         xpath=(//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//span)[1]
        #Recharge Heading
        Text Verification                   xpath=(//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//div[@class='j-text j-text-heading-xs'])      Recharge
        #Mobile No TextField
        Wait For And Verify Element         xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//input[@type='tel']
        #Cross Icon
        Wait For And Verify Element         xpath=(//div[contains(@class,'j-modal-visible j-modal-closable')]//button)[1]

        #----------------Recharge Popup Functionality Verification-------------------------------------------#
        Element Should Be Disabled          xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//button[@aria-label="button Continue"]
        Wait For And Input Text             xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//input[@type='tel']    ${Incorrect_No1} 
        Element Should Be Enabled           xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//button[@aria-label="button Continue"]
        Wait For And Click Element          xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//button[@aria-label="button Continue"]
        #Invalid Number Error
        Text Verification                   xpath=//div[@class='txt-align--left j-text j-text-body-s']      It seems you have entered a non-Jio number. Please try again with a Jio number
        Close Popup                         xpath=(//div[contains(@class,'j-modal-visible j-modal-closable')]//button)[1]
        Open Popup                          ${Recharge_locator}

    END

    #------------Redirection To Paymnet Page----------------------------------------------------#
    Sleep   200ms
    Enter Number and Proceed        xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//input[@type='tel']  ${Mobile_No}   xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//button[@aria-label="button Continue"] 
    Wait For And Verify Content     xpath=//p[@class="css-1e3ildx"]  ${Amt}
    Take Screenshot                 ${Amt}_Payment_Page
    #${P_Name}=        Convert To Lower Case   ${P_Name}
    Go To                            ${Plan_URL}


Visit "${Page_name}" of "${URL}"
    Go To                           ${URL}
    Wait For And Click Element      ${Page_name}
