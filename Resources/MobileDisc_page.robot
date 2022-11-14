*** Settings ***
Resource                            Mobile_PO/Discover_PO/RedirectionToMobile.robot
Resource                            Mobile_PO/Discover_PO/Banner_Functionality.robot
Resource                            Mobile_PO/Discover_PO/Hot_deals_on_cool_devices.robot
Resource                            Mobile_PO/Discover_PO/A_bouquet_of_JioApps.robot
Resource                            Mobile_PO/Discover_PO/Here_why_India_prefers_Jio.robot
Resource                            Mobile_PO/Discover_PO/What_Trending.robot
Resource                            Mobile_PO/Discover_PO/Already_a_Jio_User.robot
Resource                            Mobile_PO/Discover_PO/popular_Mobile_plans.robot
Resource                            Mobile_PO/Discover_PO/ThrilledAboutJioBenefits.robot
Resource                            Mobile_PO/Discover_PO/PayBill_Popup.robot
Resource                            Mobile_PO/Discover_PO/Recharge_Popup.robot

#Rearrange according TC order on devops
*** Keywords ***
Visit Mobile page of Jio.com
    Landing on Mobile Page
    Mobile Tab Verification

Discover Banner Verification 
    Discover Banner Validation
    
Recharge Popup Verification
    Recharge Popup Validation 

PayBill Popup Verification 
    PayBill Validation

Here why India prefers Jio Section Verification
    Here why India prefers Jio Section Validation

Thrilled about Jio benefits Section Verification
    Thrilled about Jio benefits Section Validation 

Popular Plans Prepaid Section Verification
    Popular Mobile Plans Prepaid Section Validation
 
Popular Plans Postpaid Section Verification
    Popular Mobile Plans Postpaid Section Validation 

What Trending Section Verification
    What Trending Section Validation

Already a Jio User Section Verification
    Already a Jio User Section Validation

Hot deals on cool devices Section Verification
    Hot deals on cool devices Section Validation

A bouquet of JioApps Section Verification
    A Bouquet of JioApps Section Validation

Discover Need Guidance Section Verification
    Need Guidance Section Validation


    


