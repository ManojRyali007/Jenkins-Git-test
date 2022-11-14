*** Settings ***
Library                              SeleniumLibrary



*** Keywords ***

MyCart icon redirection with product
    Add Product to Cart
    Visit Main Page
    Wait For And Verify Content         xpath=//span[@id='cartCountNew']  1
    Take Screenshot                     MyCart_HomePage
    Wait For And Click element          xpath=//button[@title="My Cart"]
    Wait for and Verify Element         xpath=//img[@id="491581400"]
    Log To Console                      Product Verified in CartPage
    Take Screenshot                     Product_in_Cart_Redirection




Add Product to Cart
    Visit Main Page
    Wait For And Click element          xpath=//a[contains(text(),'Shop')]
    Wait For And Click element          xpath=//a[contains(text(),'Accessories')]
    Wait For And Click element          xpath=//img[@id="491581400"]
    Wait For And Input Text             xpath=(//input[contains(@class,"pincode")])[1]      521225
    Wait For And Click element          xpath=//button[contains(@class,"pincode")]
    Wait for and Verify Element         xpath=//div[@id='stock-availaible-message']//p[contains(text(),'Stock available')]
    Wait For And Click element          xpath=//button[@id="AddToCartBTN"]
    Wait for and Verify Element         xpath=//div[@class="digi-cartpopup-title desktop-heading-xs"][contains(text(),'cart!')]
    Sleep                               1s
    Wait For And Click element          xpath=//a[contains(text(),'Go to')]
    Wait For And Verify Content         xpath=//span[@id='cartCountNew']  1
    Take Screenshot                     Product_To_Cart