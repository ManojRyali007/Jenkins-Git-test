*** Settings ***
Library                             SeleniumLibrary
Library                             ExcelLibrary
Library                             String

*** Keywords ***
#Apps page
Reading Data of Apps Page from Excel
        [Arguments]          ${ROW}
        ${App_name}=                    Read Excel Cell          row_num=${ROW}     col_num=1   sheet_name=Apps_Page
        ${Subtitle}=                    Read Excel Cell          row_num=${ROW}     col_num=2   sheet_name=Apps_Page
        ${GN_Data_id}=                  Read Excel Cell          row_num=${ROW}     col_num=3   sheet_name=Apps_Page 
        ${KM_Data_id}=                  Read Excel Cell          row_num=${ROW}     col_num=4   sheet_name=Apps_Page 
        ${Button_2}=                    Read Excel Cell          row_num=${ROW}     col_num=5   sheet_name=Apps_Page
        ${TopText}=                     Read Excel Cell          row_num=${ROW}     col_num=6   sheet_name=Apps_Page
        ${BottomText}=                  Read Excel Cell          row_num=${ROW}     col_num=7   sheet_name=Apps_Page
        ${Infographics}=                Read Excel Cell          row_num=${ROW}     col_num=8   sheet_name=Apps_Page
        ${InfoGraphicsLinks}=           Read Excel Cell          row_num=${ROW}     col_num=9   sheet_name=Apps_Page
        ${App_URL}=                     Read Excel Cell          row_num=${ROW}     col_num=10   sheet_name=Apps_Page
        ${Infographics}=                String.Split String             ${Infographics}      ;
        ${Length of Infographics}=      Get Length               ${Infographics}
        ${FAQ_Hyperlinks}=              Read Excel Cell          row_num=${ROW}     col_num=11   sheet_name=Apps_Page
        ${FAQ_Hyperlinks}=              String.Split String      ${FAQ_Hyperlinks}      ;
        ${Smart_Features}=              Read Excel Cell          row_num=${ROW}     col_num=12   sheet_name=Apps_Page
        ${Smart_Features}=              String.Split String      ${Smart_Features}      ;
        ${FAQ_URL}=                     Read Excel Cell          row_num=${ROW}     col_num=13   sheet_name=Apps_Page
        ${FAQ_URL}=                     String.Split String      ${FAQ_URL}      ;
        ${Infographics_URL}=            Read Excel Cell          row_num=${ROW}     col_num=14   sheet_name=Apps_Page
        ${POPUP_URL}=                   Read Excel Cell          row_num=${ROW}     col_num=15   sheet_name=Apps_Page
        ${POPUP_URL}=                   String.Split String      ${POPUP_URL}      ;
        Set Global Variable               ${App_name}                              ${App_name}
        Set Global Variable               ${Subtitle}                              ${Subtitle}
        Set Global Variable               ${GN_Data_id}                            ${GN_Data_id}
        Set Global Variable               ${KM_Data_id}                            ${KM_Data_id}
        Set Global Variable               ${Button_2}                              ${Button_2}
        Set Global Variable               ${TopText}                               ${TopText}
        Set Global Variable               ${BottomText}                            ${BottomText}
        Set Global Variable               ${Infographics}                          ${Infographics}
        Set Global Variable               ${App_URL}                               ${App_URL}
        Set Global Variable               ${InfoGraphicsLinks}                     ${InfoGraphicsLinks}
        Set Global Variable               ${Length of Infographics}                ${Length of Infographics}
        Set Global Variable               ${FAQ_Hyperlinks}                        ${FAQ_Hyperlinks}
        Set Global Variable               ${Smart_Features}                        ${Smart_Features}
        Set Global Variable               ${FAQ_URL}                               ${FAQ_URL}
        Set Global Variable               ${Infographics_URL}                       ${Infographics_URL}
        Set Global Variable               ${POPUP_URL}                       ${POPUP_URL}

        Set Screenshot Directory            ./Results/Apps_results/Screenshots/${App_name}

#Mobile Discover Page
Reading Data of Discover Mobile Page from Excel  
        ${Maintext}=                    Read Excel Cell          row_num=2      col_num=1   sheet_name=Mobile_Discover
        ${Subtext}=                     Read Excel Cell          row_num=2      col_num=2   sheet_name=Mobile_Discover
        ${DevicesMaintext}=             Read Excel Cell          row_num=3      col_num=1   sheet_name=Mobile_Discover
        ${DevicesSubtext}=              Read Excel Cell          row_num=3      col_num=2   sheet_name=Mobile_Discover
        ${PlanPrices}=                  Read Excel Cell          row_num=4      col_num=1   sheet_name=Mobile_Discover
        ${PlanValidity}=                Read Excel Cell          row_num=4      col_num=2   sheet_name=Mobile_Discover
        ${PlanData}=                    Read Excel Cell          row_num=4      col_num=3   sheet_name=Mobile_Discover
        ${TotalData}=                   Read Excel Cell          row_num=4      col_num=4   sheet_name=Mobile_Discover
        ${PostpaidPlanPrices}=          Read Excel Cell          row_num=5      col_num=1   sheet_name=Mobile_Discover
        ${PostpaidPlanData}=            Read Excel Cell          row_num=5      col_num=2   sheet_name=Mobile_Discover
        ${Maintext}=                    String.Split String             ${Maintext}             ;
        ${Subtext}=                     String.Split String             ${Subtext}              ;
        ${DevicesMaintext}=             String.Split String             ${DevicesMaintext}      ;
        ${DevicesSubtext}=              String.Split String             ${DevicesSubtext}       ;
        ${PlanPrices}=                  String.Split String             ${PlanPrices}           ;
        ${PlanValidity}=                String.Split String             ${PlanValidity}         ;
        ${PlanData}=                    String.Split String             ${PlanData}             ;
        ${TotalData}=                   String.Split String             ${TotalData}            ;
        ${PostpaidPlanPrices}=          String.Split String             ${PostpaidPlanPrices}             ;
        ${PostpaidPlanData}=          String.Split String               ${PostpaidPlanData}            ;
        ${Plan_Amount}=                 Read Excel Cell         row_num=8       col_num=1       sheet_name=Mobile_Discover
        ${Plan_Amount}=                 String.Split String                ${Plan_Amount}              ;
        ${Plan_Description}=            Read Excel Cell         row_num=8       col_num=2       sheet_name=Mobile_Discover
        ${Plan_Description}=            String.Split String                ${Plan_Description}         ;        
        ${Validity}=                    Read Excel Cell         row_num=8       col_num=3       sheet_name=Mobile_Discover
        ${Validity}=                    String.Split String                ${Validity}                 ;        
        ${Benefits}=                    Read Excel Cell         row_num=8       col_num=4       sheet_name=Mobile_Discover
        ${Benefits}=                    String.Split String                ${Benefits}                 ;
        ${FPrice}=                      Read Excel Cell          row_num=8      col_num=5       sheet_name=Mobile_Discover
        ${FPrice}=                      String.Split String      ${FPrice}        ;
        ${FBenefits}=                   Read Excel Cell          row_num=8      col_num=6       sheet_name=Mobile_Discover
        ${FBenefits}=                   String.Split String      ${FBenefits}       ;
        Set Global Variable               ${Maintext}                             ${Maintext}
        Set Global Variable               ${Subtext}                              ${Subtext}
        Set Global Variable               ${DevicesMaintext}                      ${DevicesMaintext}
        Set Global Variable               ${DevicesSubtext}                       ${DevicesSubtext}
        Set Global Variable               ${PlanPrices}                           ${PlanPrices}
        Set Global Variable               ${PlanValidity}                         ${PlanValidity}
        Set Global Variable               ${PlanData}                             ${PlanData}
        Set Global Variable               ${TotalData}                            ${TotalData}
        Set Global Variable               ${PostpaidPlanPrices}                   ${PostpaidPlanPrices}
        Set Global Variable               ${PostpaidPlanData}                    ${PostpaidPlanData}
        Set Global Variable               ${Plan_Amount}                        ${Plan_Amount}
        Set Global Variable               ${Plan_Description}                   ${Plan_Description}
        Set Global Variable               ${Validity}                           ${Validity}
        Set Global Variable               ${Benefits}                           ${Benefits}
        Set Global Variable               ${FPrice}                             ${FPrice}
        Set Global Variable               ${FBenefits}                          ${FBenefits} 

#Home Page
Reading Data of Home Page from Excel     
        ${Quick_Action}=              Read Excel Cell          row_num=2     col_num=1   sheet_name=Home_Page
        ${Quick_Action}=              String.Split String      ${Quick_Action}        ;
        ${MPrice}=                     Read Excel Cell          row_num=2     col_num=2   sheet_name=Home_Page
        ${MPrice}=                     String.Split String      ${MPrice}        ;
        ${Desc}=                      Read Excel Cell          row_num=2     col_num=3   sheet_name=Home_Page
        ${Desc}=                      String.Split String      ${Desc}        ;
        ${Validaty}=                  Read Excel Cell          row_num=2     col_num=4   sheet_name=Home_Page
        ${Validaty}=                  String.Split String      ${Validaty}        ;
        ${MBenefits}=                  Read Excel Cell          row_num=2     col_num=5   sheet_name=Home_Page
        ${MBenefits}=                  String.Split String      ${MBenefits}        ;
        ${FPrice}=                     Read Excel Cell          row_num=2     col_num=6   sheet_name=Home_Page
        ${FPrice}=                     String.Split String      ${FPrice}        ;
        ${FBenefits}=                  Read Excel Cell          row_num=2     col_num=7   sheet_name=Home_Page
        ${FBenefits}=                  String.Split String      ${FBenefits}       ;
        Set Global Variable           ${Quick_Action}                                ${Quick_Action}
        Set Global Variable           ${MPrice}                                      ${MPrice}
        Set Global Variable           ${Desc}                                        ${Desc}
        Set Global Variable           ${Validaty}                                    ${Validaty}
        Set Global Variable           ${MBenefits}                                   ${MBenefits}
        Set Global Variable           ${FPrice}                                      ${FPrice}
        Set Global Variable           ${FBenefits}                                   ${FBenefits}
        

        