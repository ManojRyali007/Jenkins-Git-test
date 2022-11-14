*** Settings ***
Resource                            Mobile_PO/Prepaid_PO/Redirection_to_Prepaid.robot
Resource                            Mobile_PO/Prepaid_PO/Plans with OTT Benefits.robot
Resource                            Mobile_PO/Prepaid_PO/4G Data Voucher.robot
Resource                            Mobile_PO/Prepaid_PO/JioLink.robot
Resource                            Mobile_PO/Prepaid_PO/JioSaavn Pro.robot

*** Variables ***
${4G Data Voucher Plans}=         xpath=//button[@aria-label="button 4G Data Voucher"]
${Jio.com_Mobile_PrepaidPage}=        https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/



*** Keywords ***

Visit Mobile-Prepaid page of Jio.com
    Landing on Mobile Prepaid Page

Verify Top Banner on Mobile Prepaid Page
    Top Banner Verification on Mobile Prepaid Page

Verify All Plan Buttons Redirection on Mobile Prepaid Page
    All Plan Buttons Redirection on Mobile Prepaid Page

Verify and Validate Plans with OTT Benefits Page
    Redirection to Plans with OTT Benefits Page                                                             #[Done] TC 23
    Validate UI and Content of Plans with OTT Benefits Page                                                 #[Done] TC 24
    Verify and Validate Plan Cards and Recharge Redirection of All OTT Plans                                #[Done] TC 33 - 38
    Verify Redirection of More Information section                                                          #[Done] TC 40                     

Verify and Validate 4G Data Voucher Page
    #Redirection to 4G Voucher Plans Page                                                                    #[Done] TC 61
    #Validate UI and Content of 4G Data Voucher Plans Page                                                   #[Done] TC 62
    #Filter button functionality of 4G Data Voucher Plans Page                                               #[Done] TC 63-68
    #View all Sub plans button Redirection                                                                   #[Done] TC 69
    Verify and Validate Plan Cards and Recharge Redirection of All 4g Data Voucher Plans                    #[Done] TC 70-75
    #Verify Redirection of More Information section 4G Data Voucher Page                                     #[Done] TC 77
    #Visit "${4G Data Voucher Plans}" of "${Jio.com_Mobile_PrepaidPage}"
    


Verify and Validate JioLink Plans Page
    Redirection to JioLink Plans Page                                                                       #[Done] TC 141
    Validate UI and Content of JioLink Plans Page                                                           #[Done] TC 142
    Filter button functionality of JioLink Plans Page                                                       #[Done] TC 143-148
    Verify and Validate Plan Cards of JioLink Page                                                          #[Done] TC 147-153
    Verify Redirection of More Information section on JioLink Plans Page                                    #[Done] TC 157
    

Verify and Validate JioSaavn Pro Plans Page
    Redirection to JioSaavn Pro Plans Page                                                                  #[Done] TC 158
    Validate UI and Content of JioSaavn Pro Plans Page                                                      #[Done] TC 159
    Verify and Validate Plan Cards of All JioSaavn Pro Plans                                                #[Done] TC 160-162
    Verify Redirection of More Information section on JioSaavn Pro Plans Page                               #[Done] TC 166

















#robot -d Results/Mobile_Results/Prepaid_Results  -i TC-23  Tests/Mobile_tests/Prepaid_Tests/Prepaid_main.robot