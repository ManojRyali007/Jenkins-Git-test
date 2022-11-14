*** Settings ***
Resource                            Home_PO/RedirectionToHome.robot
Resource                            Apps_PO/Apps_redirection.robot
Resource                            Home_PO/UI_verification.robot 
Resource                            Home_PO/Carousel_Banners.robot
Resource                            Home_PO/Quick_Recharge.robot
Resource                            Home_PO/Pay_Bills.robot
Resource                            Home_PO/Get_JioSIM.robot
Resource                            Home_PO/Get_JioFiber.robot
Resource                            Home_PO/Spotlight.robot
Resource                            Home_PO/Ajio.robot
Resource                            Home_PO/Discover_New.robot
Resource                            Home_PO/Supercharge_Business.robot
Resource                            Home_PO/LatestDevices.robot
Resource                            Home_PO/MakingDifference.robot
Resource                            Home_PO/Header_Footer.robot
Resource                            Home_PO/QRcode.robot


*** Keywords ***
Visit Home Page on Jio.com
    Landing on Home Page

Header Content Verification
    Header Content Validation

Home Page UI Elements Verification
    Home Page UI Elements Validation

Play Videos from Banners
    Carousel Banner Videos

Home Carousel Banners Redirection
    Carousel Banner Redirection

Quick actions UI Elements Verification
    Quick Action Section Verification

Quick Recharge Popup Verification
    Quick Recharge Popup Validation

Pay bills Popup Verification    
    Pay Bills Popup Validation
    
Get Jio SIM Popup Verification
    Get Jio SIM Popup Validation

Get Jio Fiber Popup Verification
    Get Jio Fiber Popup Validation

Visit Port to Jio Page
    Port to Jio Page Redirection

Visit Help & Support Page 
    Help & Support Page Redirection

In the Spotlight Section Verification
    In the Spotlight Section Validation

Digital Life Section Verification
    Digital Life Section Validation

Discover New Section Verification
    Discover New Section Validation

Latest and Trending Devices Section Verification
    Latest and Trending Devices Section Validation

Create your own opportunities Banner Verification
    Create your own opportunities Banner Validation

Making a Difference Verification
    Making a Difference Validation

Supercharge your Business Verification
    Supercharge your Business Validation

QR code Section Verification
    QR Code Validation

Home Need Guidance Section Verification  
    Need Guidance Section Validation

Footer Section Verification
    Footer Content Validation

