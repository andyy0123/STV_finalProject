*** Settings ***
Suite Setup       suiteSetup
Suite Teardown    suiteTearDown
Resource          keywords/keyword.robot
Library           AppiumLibrary

*** Variables ***
${specialCharacter}    ,.?!@:;()*#

*** Test Cases ***
addOneMemo
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    addOneMemo    Buy a pen
    Press Keycode    4
    [Teardown]    deleteTopic    memo_1

enterTheMemoEditing
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_edit"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    新增項目
    Press Keycode    4
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Text    新增項目
    Press Keycode    4
    [Teardown]    deleteTopic    memo_1

quitTheMemoEditing
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_edit"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    新增項目
    Press Keycode    4
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Text    新增項目
    Press Keycode    4
    [Teardown]    deleteTopic    memo_1

editOneMemo
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    addOneMemo    Buy a pen
    editOneMemo    Buy a pen    Buy a pencil.
    Press Keycode    4
    [Teardown]    deleteTopic    memo_1

deleteOneMemo
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    addOneMemo    Buy a pen
    deleteOneMemo    Buy a pen
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    memo_1

dragAndDropMemo
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    addOneMemo    Buy a pen
    addOneMemo    See a bat
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_edit"]
    swipe    64    355    64    475    5000
    @{list}    Get Webelements    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_memo_item_content"]
    Element Text Should Be    @{list}[0]    Buy a pen
    Element Text Should Be    @{list}[1]    See a bat
    Press Keycode    4
    Press Keycode    4
    [Teardown]    deleteTopic    memo_1

addOneMemoWithThousandsCharacter
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_edit"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RelativeLayout[@resource-id="com.kiminonawa.mydiary:id/Layout_memo_item_add"]
    Wait Until Page Contains    確定
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.EditText    0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_edit_memo_ok"]
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    000000000000
    Press Keycode    4
    [Teardown]    deleteTopic    memo_1

addOneMemoWithSpecialCharacter
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    addOneMemo    ${specialCharacter}
    Press Keycode    4
    [Teardown]    deleteTopic    memo_1
