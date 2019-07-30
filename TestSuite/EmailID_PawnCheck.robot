
*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Resource        ${EXECDIR}/Res/resource.robot
Variables       ${EXECDIR}/VariableFiles/Config.yaml

*** Test Cases ***


TEST EMail Frontend
    Setup chromedriver
    :FOR  ${ITERATION}  IN RANGE  1  ${LOOP}
    \   Log To Console  \nIteration No.: ${ITERATION}
    \   Run Keyword and Continue on Failure  portal check
    Close Browser


	



