*** Settings ***
Suite Setup       suiteSetup
Suite Teardown    suiteTearDown
Resource          keywords/keyword.robot
Library           AppiumLibrary

*** Variables ***
${specialCharacter}    ,.?!@:;()*#

*** Test Cases ***
clearContentOfDiary
    [Setup]    diarySetup
    Wait until keyword succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    Wait until keyword succeeds    15s    1s    Click Element    //android.widget.RadioButton[@resource-id="com.kiminonawa.mydiary:id/But_diary_topbar_diary"]
    Wait until keyword succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]    Diary_1_#1
    Hide Keyboard
    Click Element    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]
    Input Text    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]/android.widget.EditText    Today is Sunday.
    Hide Keyboard
    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_clear"]
    Wait until keyword succeeds    15s    1s    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_common_ok"]
    Page Should Not Contain Text    Diary_1_#1
    Page Should Not Contain Text    Today is Sunday.
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

addOneDiary
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    20180615    today is a good day.
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

editOneDiary
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    20180615    hello
    editOneDiary    20180615    hello    20180622    goodbye
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

deleteDiary
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    20180615    hello
    deleteDiary    20180615
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

changePage
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    Wait Until Keyword Succeeds    15s    1s    swipe    700    970    20
    ...    970
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    //android.widget.RelativeLayout[@resource-id="com.kiminonawa.mydiary:id/RL_calendar_content"]
    Wait Until Keyword Succeeds    15s    1s    swipe    700    970    20
    ...    970
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    在此寫下你的日記內容
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

diaryTitleWithSpecialCharacter
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    ${specialCharacter}    today is a good day.
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

diaryContentWithSpecialCharacter
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    20180605    ${specialCharacter}
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

dairyTitleWithThousandsCharacter
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RadioButton[@resource-id="com.kiminonawa.mydiary:id/But_diary_topbar_diary"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    Hide Keyboard
    Click Element    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]/android.widget.EditText    haha
    Hide Keyboard
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    000000000000000000
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

theSecondKindOfEditingDiary
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    20180615    hello
    editDiaryByClickButton    20180615    hello    edited    haha
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

diaryContentWithThousandsCharacter
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RadioButton[@resource-id="com.kiminonawa.mydiary:id/But_diary_topbar_diary"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]    20180605
    Hide Keyboard
    Click Element    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]/android.widget.EditText    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    Hide Keyboard
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    20180605
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

addDiaryWithoutTitle
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RadioButton[@resource-id="com.kiminonawa.mydiary:id/But_diary_topbar_diary"]
    Wait Until Page Contains    在此寫下你的日記內容
    Click A Point    360    625
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]/android.widget.EditText    hello
    Hide Keyboard
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    hello
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

addDiaryWithoutContent
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RadioButton[@resource-id="com.kiminonawa.mydiary:id/But_diary_topbar_diary"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]    20180606
    Hide Keyboard
    Click A Point    360    625
    Hide Keyboard
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    20180606
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

addDiaryWithoutTitleAndContent
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RadioButton[@resource-id="com.kiminonawa.mydiary:id/But_diary_topbar_diary"]
    Wait Until Page Contains    在此寫下你的日記內容
    Click A Point    250    500
    Hide Keyboard
    Click A Point    360    625
    Hide Keyboard
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    無標題
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1

countNumberOfDiary
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    20180601    hello
    addOneDiary    20180602    haha
    addOneDiary    20180603    bye
    Page Should Contain Text    3 項目
    Press Keycode    4
    [Teardown]    deleteTopic    diary_1
