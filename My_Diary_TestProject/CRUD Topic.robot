*** Settings ***
Suite Setup       suiteSetup
Suite Teardown    suiteTearDown
Library           AppiumLibrary
Resource          keywords/keyword.robot

*** Variables ***
${specialCharacter}    ,.?!@:;()*#

*** Test Cases ***
addContacts
    addTopic    Contacts_1    聯絡人
    [Teardown]    deleteTopic    Contacts_1

addDiary
    addTopic    Diary_1    日記
    [Teardown]    deleteTopic    Diary_1

addMemo
    addTopic    Memo_1    備忘錄
    [Teardown]    deleteTopic    Memo_1

deleteContacts
    [Setup]    contactsSetup
    deleteTopic    contacts_1

deleteDiary
    [Setup]    diarySetup
    deleteTopic    diary_1

deleteMemo
    [Setup]    memoSetup
    deleteTopic    memo_1

searchFullNameOfContacts
    [Setup]    addManyTopic
    searchTopic    diary_1
    [Teardown]    deleteManyTopic

addDuplicateTopicName
    [Setup]    contactsSetup
    addTopic    contacts_1    聯絡人
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_delete"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_main_profile"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    contacts_1
    deleteTopic    contacts_1

addContactsWithSpecialCharacters
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting_add_topic"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_topic_detail_title"]    ${specialCharacter}
    click Element    //android.widget.Spinner[@resource-id="com.kiminonawa.mydiary:id/SP_topic_detail_type"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.CheckedTextView[@text="聯絡人"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_topic_detail_ok"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    //android.widget.TextView[@text="${specialCharacter}"]
    [Teardown]    deleteTopic    ${specialCharacter}

dragAndDropTopic
    [Setup]    contactsSetup
    diarySetup
    swipe    372    290    372    410    5000
    @{list}    Get Webelements    //android.widget.TextView[@resource-id="com.kiminonawa.mydiary:id/TV_topic_title"]
    Element Text Should Be    @{list}[0]    contacts_1
    Element Text Should Be    @{list}[1]    diary_1
    deleteTopic    contacts_1
    deleteTopic    diary_1

countNumberOfContacts
    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    Jack    09123456789
    addOneContact    Mark    09223456789
    addOneContact    Andy    09323456789
    Wait Until Page Contains    contacts_1
    Press Keycode    4
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Page Should Contain Text    3
    [Teardown]    deleteTopic    contacts_1

countNumberOfDiary
    [Setup]    diarySetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="diary_1"]
    addOneDiary    20180601    hello
    addOneDiary    20180602    haha
    addOneDiary    20180603    bye
    Page Should Contain Text    3 項目
    Press Keycode    4
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Page Should Contain Text    3
    [Teardown]    deleteTopic    diary_1

countNumberOfMemo
    [Setup]    memoSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="memo_1"]
    addOneMemo    memoOne
    addOneMemo    memoTwo
    addOneMemo    memoThree
    Wait Until Page Contains    memo_1
    Press Keycode    4
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Page Should Contain Text    3
    [Teardown]    deleteTopic    memo_1

editContacts
    [Setup]    contactsSetup
    editTopic    editedcontacts_1
    [Teardown]    deleteTopic    editedcontacts_1

editDiary
    [Setup]    diarySetup
    editTopic    editeddiary_1
    [Teardown]    deleteTopic    editeddiary_1

editMemo
    [Setup]    memoSetup
    editTopic    editedmemo_1
    [Teardown]    deleteTopic    editedmemo_1

topicNameWithThousandsCharacter
    ${thousandsCharacterOfString}=    Set Variable    i
    : FOR    ${i}    IN RANGE    1    1000
    \    ${thousandsCharacterOfString}    Catenate    SEPARATOR=    ${thousandsCharacterOfString}    i
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting_add_topic"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_topic_detail_title"]    ${thousandsCharacterOfString}
    click Element    //android.widget.Spinner[@resource-id="com.kiminonawa.mydiary:id/SP_topic_detail_type"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.CheckedTextView[@text="日記"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_topic_detail_ok"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_delete"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_main_profile"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Text    iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii

searchNotFullNameOfContacts
    [Setup]    addManyTopic
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_main_topic_search"]    contac
    hide keyboard
    Page Should Contain Text    contacts_1
    Page Should Contain Text    contacts_2
    Clear Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_main_topic_search"]
    hide keyboard
    [Teardown]    deleteManyTopic

searchNotExistedNameOfContacts
    [Setup]    addManyTopic
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_main_topic_search"]    unexisted
    hide keyboard
    Page should not contain Element    //android.widget.TextView[@text="unexisted"]
    Clear Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_main_topic_search"]
    hide keyboard
    [Teardown]    deleteManyTopic

editedContactsWithSpecialCharacters
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_edit"]
    Wait Until Page Contains Element    //android.widget.TextView[@text="主題名稱"]    15s
    Clear Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_topic_detail_title"]
    hide keyboard
    InputText    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_topic_detail_title"]    ${specialCharacter}
    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_topic_detail_ok"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Swipe    468    300    220    300
    Click A Point    372    290
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    //android.widget.TextView[@text="${specialCharacter}"]
    Press Keycode    4
    [Teardown]    deleteTopic    ,.?!@:;()*#

*** Keywords ***
