*** Settings ***
Library    SeleniumLibrary 

*** KeyWords ***
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
Select from drpdwn
    [Arguments]    ${a}    ${b}   
    Execute Javascript     document.getElementsByClassName('dropdown-content')[${a}].childNodes[${b}].click()
Select next
    Execute Javascript    document.getElementsByClassName('material-icons')[1].click()
Select cart drpdwn
    [Arguments]    ${c}    ${d}
    Execute Javascript    document.getElementsByClassName('dropdown-content ')[${c}].childNodes[${d}].click()

CheckoutProcess
   #Log in
    Input Text             ${txtBoxUser}                         &{LOG IN DATA}[username]
    Input Password         ${txtBoxpwd}                          &{LOG IN DATA}[password]
    Click Button           ${LoginButton}
    
    Sleep    10            
    #Choosing Product
    Click Element          ${ProductTab}
    Click Element          ${ChooseProduct}
    
    Sleep    10 
    #Add project and quantity
    Click Button         ${AddPrjctBtn}
    Click Button         ${slctQty}
    Input Text           &{QtyTxtBox}[LocateQty]               &{QtyTxtBox}[QtyValue] 
        
    Click Element        ${NextBtn} 
    Click Element        ${ChooseLoc}  
    
    Scroll Page To Location    0    2000 
    Sleep   10
    #Upload image
    Click Element        ${UploadBtn}  
    Sleep   5        
    Choose File          &{ChooseImg}[UploadBtn]    &{ChooseImg}[ImgPath] 
    Click Button         ${UploadFile}  
    Click Element        ${ClickImg}
    Click Element        ${SlctColor}
    Click Element        ${CloseBtn}
    Sleep   5
    Click Element        ${WidthList} 
    Sleep   5
    Select from drpdwn      0          5
    Click Element        ${PrintDst} 
     Sleep   5
    Select from drpdwn      1           3
    Sleep   5   
    Click Element        ${Placement}   
    Select from drpdwn       2           2
    Click Button         ${SbmtBtn}
    Sleep  5   
    Click Element        ${nxt} 
    Sleep  5  
    Select next
    Sleep  5
    Select next
    Sleep  5
    #final checkout
    Select cart drpdwn     0                2  
    Sleep  5
    Select cart drpdwn     1                2  
    Sleep  5
    Select cart drpdwn     2                2  
    Sleep  5
    Click Button        ${Checkoutbtn}
    Click Button        ${CrtPop}  
    Close Browser  
    
*** Variables ***
#This area is for locators and test data
${URL}  https://demo.theprintlife.com/login/
${txtBoxUser}  //input[@id="wpmp_username"]
${txtBoxpwd}  //input[@id="wpmp_password"]        
${LoginButton}  //button[@type="submit"]
&{LOG IN DATA}  username=sanjay   password=m2n1shlko
${ProductTab}  //li[@id="menu-item-136"]          
${ChooseProduct}  //img[@class="responsive-img in"][@on-error-src="https://www.ssactivewear.com/Images/Style/2839_fm.jpg"]
${AddPrjctBtn}  //button[@ng-click="manageSelectedColors(isAlreadyExist)"]
${slctQty}  //button[@id="submit_color"] 
&{QtyTxtBox}  LocateQty=//*[@id="wrapper"]/form/span/div/div/div[2]/div/div[1]/div/input[1]        QtyValue=14
${NextBtn}  //a[@class="btn-flat"]
${ChooseLoc}    //a[@ng-click="setPrintLocation('front');"]   
${UploadBtn}  //a[@data-target="art-manager"][@ng-click="setActiveLocation('front', 'artwork', 'stepone')"] 
&{ChooseImg}  UploadBtn=//input[@type="file"]          ImgPath=C:\\Users\\laitkor\\Pictures\\spidy.jpg
${UploadFile}  //button[@ng-click="uploadFile(noOfColor)"]
${ClickImg}  //div[@class="selected-file modal-trigger ng-scope"]
${SlctColor}  //li[@title="82500 Yellow"]
${CloseBtn}  //*[@id="ink-picker"]/div/div[1]/button/i
${WidthList}  //*[@id="art-manager"]/div/div[2]/div/div[3]/div/div[1]/div/input
${PrintDst}   //*[@id="art-manager"]/div/div[2]/div/div[3]/div/div[2]/div/input
${Placement}  //*[@id="art-manager"]/div/div[2]/div/div[3]/div/div[3]/div/input
${SbmtBtn}    //*[@id="art-manager"]/div/div[2]/div/div[3]/div/button[1]
${nxt}        //a[@class="btn-flat"]
${Checkoutbtn}  //button[@ng-click="saveQuote('payment')"]
${CrtPop}      //*[@id="payTerms"]/div/div[2]/div[2]/div/button
  

*** Test Cases ***

Selenium Monument test
    
    [Documentation]    This is for Monument Checkout Process 
        
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    20
    CheckoutProcess
    

        
    

    
    

    
    
    