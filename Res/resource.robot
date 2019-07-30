*** Settings ***
Variables       ${EXECDIR}/VariableFiles/Config.yaml
Library    String
Library    OperatingSystem

***Variables***
${TIMEOUT}                          20
${SLEEP}                            5
${link}                             https://haveibeenpwned.com/
${title}                            Have I Been Pwned: Check if your email has been compromised in a data breach
${input_txt}                        //input[@id='Account']
${submit_btn}                       //button[@id='searchPwnage']
${pwnCount}                         //p[@id='pwnCount']
${ret_val}                          Pwned on breached sites and found paste (subscribe to search sensitive breaches)
${pwned_not_found}                  //h2[contains(text(),'no pwnage found!')]
${pwned_not_found_txt}              //p[contains(text(),'No')]
${pwned_found}                      //h2[contains(text(),'pwned!')]
${pwned_found_txt}                  //p[@id='pwnCount']


*** Keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  ${EXECDIR}/chromedriver.exe
  
Test Fail Teardown
    Capture Page Screenshot
    Close Browser

portal check
    Open Browser    ${SITE_URL}    ${CHROME}
    #Maximize Browser Window
    Wait Until Element Is Visible  xpath=//p[contains(text(),'Check if you have an account that has been comprom')]
    ${contents}=   Get File   ${CURDIR}\\emailidlist.txt
    Log to console  ${contents}
    @{lines}=   Split to lines   ${contents}
    :FOR   ${line}   IN   @{lines}
    \   log   ${line}   WARN
    \   ${Value}=   Get Variable Value  ${line}
    \   Wait Until Element Is Visible  xpath=${input_txt}
    \   Input Text  xpath=${input_txt}  ${Value}
    \   Wait Until Element Is Visible  xpath=${submit_btn}
    \   Click Element  xpath=${submit_btn}
    \   Log to Console  EMail ID Entered and Submitted!!!
    \   BuiltIn.sleep  5
    \   ${presence_status}  Run keyword and return status  Wait Until Element Is Visible   ${pwned_found}
    \   Run Keyword If    '${presence_status}' == 'True'  Run Keywords  Taking Text 
    Close Browser
    
Taking Text
    ${text_value}    Get Text   ${pwnCount}  
    Log to console   Pawn found
    #Fail