*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${BASE_URL}    http://localhost:5173
${LOGIN_URL}    ${BASE_URL}/login
${USERNAME}    WOJA
${PASSWORD}    111111
${IMAGE_PATH}    C:\Users\matem\OneDrive\เอกสาร\1714127527123.jpeg
${POST_SUCCESS_MESSAGE}    Post created successfully
${DELAY}    1s

*** Test Cases ***

# 1. Test Case: Login and Create Post
Login And Create Post
    [Documentation]    This test case automates the process of logging in, creating a post, and logging out.
    Go To    ${LOGIN_URL}
    Sleep    ${DELAY}
    Input Text    id=identifier    ${USERNAME}
    Sleep    ${DELAY}
    Input Text    id=loginPassword    ${PASSWORD}
    Sleep    ${DELAY}
    Click Button    id=login-submit-button
    Sleep    ${DELAY}
    
    # Navigate to Post page
    Go To    ${BASE_URL}/create-post
    Sleep    ${DELAY}
    
    # Fill in the post form
    Input Text    id=name_games    Example Board Game
    Sleep    ${DELAY}
    Input Text    id=detail_post    This is a detailed description of the board game.
    Sleep    ${DELAY}
    Input Text    id=num_people    4
    Sleep    ${DELAY}
    Choose File    id=file-input    ${IMAGE_PATH}
    Sleep    ${DELAY}
    
    # Click and fill in the date field
    Click Element    id=date_meet
    Sleep    ${DELAY}
    Input Text    id=date_meet    2024-11-10
    Sleep    ${DELAY}
    
    # Click and fill in the time field
    Click Element    id=time_meet
    Sleep    ${DELAY}
    Input Text    id=time_meet    13:30
    Sleep    ${DELAY}
    
    # Submit the post
    Click Button    id=create-post-button
    Sleep    ${DELAY}
    Wait Until Page Contains    ${POST_SUCCESS_MESSAGE}    10s
    Sleep    ${DELAY}
    
    # Screenshot after post creation
    Capture Page Screenshot    ${CURDIR}/screenshots/create_post_success.png
    Sleep    ${DELAY}
    
    # Logout
    Click Link    text=Logout
    Sleep    ${DELAY}
    Wait Until Page Contains    Login    10s
    Sleep    ${DELAY}
    Capture Page Screenshot    ${CURDIR}/screenshots/logout_success.png
    Sleep    ${DELAY}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    chrome
    Sleep    ${DELAY}
    Maximize Browser Window
    Sleep    ${DELAY}

Close Browser
    Close All Browsers
    Sleep    ${DELAY}
