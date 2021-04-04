*** Settings ***
Library    SeleniumLibrary
Documentation    Checking out the built_in library


# Many ways to run:
# robot -d results/built-in  tests/Built_in.robot      //running this way, the title in the log file is "Built_in Log", which is more meaningful
# robot -d results/built-in  -i Built_in  tests
# robot -d results tests        //running this way, the title in the log file is "Tests Log", which is not very meaningfule.


*** Variables ***
${GLOBAL1}     I am global variable 1
${SOME_GLOBAL_DATA}  This is available everywhere


*** Test Cases ***
Declare and Set variables
    ${some_test-data}    Set Variable    This is only available within this test
    Set Test Variable    ${more_test_data}   This is also only available within this test


    # available in all tests in the current set suite
    Set Suite Variable    ${some_suite_data}   This is available within all testcases in this suite

    # available in all tests in all suites
    Set Global Variable    ${SOME_GLOBAL_DATA}  This is available everywhere


Logging stuff
    [Tags]     BuiltIn
    Comment    ${unset_variable}
    Comment    Just a random Comment
    Comment    ${GLOBAL1}
    Log        I have something to say
    Log Many   Somthing to say 1    Somthing to say 2     Something to say 3
    Log to Console    This can only be seen in the console, not the log!
    Log Variables  # this should log the values of all the variables in scope
    Log    ${some_suite_data} 
    log    ${GLOBAL1}
    log    ${SOME_GLOBAL_DATA}
    


Ignore failures in this test
    [Tags]    BuiltIn
    Open Browser    http://www.amazon.com    firefox

    # notice the log will contain a summary of erros which were encountered
    Run Keyword And Continue On failure    Wait Until Page Contains This text doesn't exist
    Run Keyword And Continue On failure    Wait Until Page Contains More text that doesn't exist
    #Run Keyword And Contiue on Failure   Log    ${Some_test_data}

    Log     ${some_suite_data}
    Log     ${GLOBAL1}
    log     ${some_global_data}
    Close Browser


Repeat things
    Repeat Keyword    3 Times    Say Something Funny
    Log    ${some_suite_data}
    Log    ${GLOBAL1}
    Log    ${SOME_GLOBAL_DATA}


*** Keywords ***
Say Something Funny
    Log    These pretzels are making me thirsty...