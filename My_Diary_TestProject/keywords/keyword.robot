*** Settings ***
Library           AppiumLibrary

*** Keywords ***
addTopic
    [Arguments]    ${topicName}    ${topicType}
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting_add_topic"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_topic_detail_title"]    ${topicName}
    click Element    //android.widget.Spinner[@resource-id="com.kiminonawa.mydiary:id/SP_topic_detail_type"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.CheckedTextView[@text="${topicType}"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_topic_detail_ok"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${topicName}

contactsSetup
    addTopic    contacts_1    聯絡人

diarySetup
    addTopic    diary_1    日記

editTopic
    [Arguments]    ${editedTopicName}
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_edit"]
    Wait Until Page Contains Element    //android.widget.TextView[@text="主題名稱"]    15s
    Clear Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_topic_detail_title"]
    InputText    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_topic_detail_title"]    ${editedTopicName}
    Hide Keyboard
    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Keyword Succeeds    15s    1s    Swipe    550    300    300
    ...    300
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Click A Point    372    290
    Wait Until Page Contains    ${editedTopicName}

enterPassword
    [Arguments]    ${digit_1}    ${digit_2}    ${digit_3}    ${digit_4}
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="${digit_1}"]
    Click Element    //android.widget.Button[@text="${digit_2}"]
    Click Element    //android.widget.Button[@text="${digit_3}"]
    Click Element    //android.widget.Button[@text="${digit_4}"]

memoSetup
    addTopic    memo_1    備忘錄

deleteTopic
    [Arguments]    ${topicName}
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_delete"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_main_profile"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Text    ${topicName}

addManyTopic
    addTopic    contacts_1    聯絡人
    addTopic    contacts_2    聯絡人
    addTopic    diary_1    日記
    addTopic    diary_2    日記
    addTopic    memo_1    備忘錄
    addTopic    memo_2    備忘錄

searchTopic
    [Arguments]    ${topicName}
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_main_topic_search"]    ${topicName}
    hide keyboard
    Page Should Contain Text    ${topicName}
    Clear Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_main_topic_search"]
    hide keyboard

deleteManyTopic
    deleteTopic    memo_2
    deleteTopic    memo_1
    deleteTopic    diary_2
    deleteTopic    diary_1
    deleteTopic    contacts_2
    deleteTopic    contacts_1

suiteSetup
    [Documentation]    \ # For suite setup
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0.1    deviceName=3100d0646269b365    app=C:\\Users\\Andy\\Desktop\\My Diary.apk
    Wait Until Page Contains    確定
    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_delete"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_delete"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_delete"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
    Wait Until Keyword Succeeds    15s    1s    Swipe    200    300    450
    ...    300
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_topic_left_setting_delete"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]

suiteTearDown
    Close Application

addOneContact
    [Arguments]    ${contactName}    ${contactPhoneNumber}
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_contacts_add"]
    Wait Until Keyword Succeeds    16s    2s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_contacts_detail_name"]    ${contactName}
    Page Should Contain Text    ${contactName}
    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_contacts_detail_phone_number"]    ${contactPhoneNumber}
    Page Should Contain Text    ${contactPhoneNumber}
    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_contacts_detail_ok"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_contacts_add"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${contactName}
    Page Should Contain Text    ${contactPhoneNumber}

editOneContact
    [Arguments]    ${editContactName}    ${editContactPhoneNumber}
    Long Press    //android.widget.TextView[@text="Jack"]
    Wait Until Page Contains    刪除
    Input Text    //android.widget.EditText[@text="Jack"]    ${editContactName}
    Hide Keyboard
    Input text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_contacts_detail_phone_number"]    ${editContactPhoneNumber}
    Hide Keyboard
    Click element    //android.widget.Button[@text="確定"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${editContactName}
    Page Should Contain Text    ${editContactPhoneNumber}

deleteContact
    [Arguments]    ${contactName}
    Long Press    //android.widget.TextView[@text="${contactName}"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="刪除"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Text    ${contactName}

addManyContacts
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Morris    0956789012
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Mark    0923456789
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Johnson    0989012345
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Jack    0912345678
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Ingrid    0934567890
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Hank    0967890123
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Chenny    0945678901
    Wait Until Keyword Succeeds    15s    1s    addOneContact    Andy    0978901234

addOneDiary
    [Arguments]    ${diaryTitle}    ${diaryContent}
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RadioButton[@resource-id="com.kiminonawa.mydiary:id/But_diary_topbar_diary"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]    ${diaryTitle}
    Hide Keyboard
    Click Element    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.LinearLayout[@resource-id="com.kiminonawa.mydiary:id/LL_diary_item_content"]/android.widget.EditText    ${diaryContent}
    Hide Keyboard
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${diaryTitle}

editOneDiary
    [Arguments]    ${diaryTitle}    ${diaryContent}    ${editedDiaryTitle}    ${editedDiaryContent}
    Long Press    //android.widget.TextView[@text="${diaryTitle}"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]    ${editedDiaryTitle}
    Hide Keyboard
    Clear Text    //android.widget.EditText[@text="${diaryContent}"]
    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]/../../android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.EditText    ${editedDiaryContent}
    Hide Keyboard
    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${editedDiaryTitle}

deleteDiary
    [Arguments]    ${diaryTitle}
    Long Press    //android.widget.TextView[@text="${diaryTitle}"]
    Comment    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_delete"]
    Comment    Wait Until Page Contains Element    //android.widget.EditText[resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]
    sleep    3s
    Click a Point    458    1216
    Wait Until Page Contains    確定
    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Not Contain Text    ${diaryTitle}

editDiaryByClickButton
    [Arguments]    ${diaryTitle}    ${diaryContent}    ${editedDiaryTitle}    ${editedDiaryContent}
    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_entries_edit"]
    Wait Until Page Contains    點選要編輯的日記
    Long Press    //android.widget.TextView[@text="${diaryTitle}"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]    ${editedDiaryTitle}
    Hide Keyboard
    Clear Text    //android.widget.EditText[@text="${diaryContent}"]
    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_diary_title"]/../../android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.EditText    ${editedDiaryContent}
    Hide Keyboard
    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_diary_save"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${editedDiaryTitle}

addOneMemo
    [Arguments]    ${memoContent}
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_edit"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.RelativeLayout[@resource-id="com.kiminonawa.mydiary:id/Layout_memo_item_add"]
    Wait Until Page Contains    確定
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.EditText    ${memoContent}
    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_edit_memo_ok"]
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${memoContent}

editOneMemo
    [Arguments]    ${oldMemoName}    ${editMemoName}
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_edit"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="${oldMemoName}"]
    Wait Until Keyword Succeeds    15s    1s    Clear Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.EditText
    Input Text    //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.EditText    ${editMemoName}
    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_edit_memo_ok"]
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    ${editMemoName}

deleteOneMemo
    [Arguments]    ${memoName}
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_edit"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_memo_item_delete"]
    Wait Until Page Does Not Contain    ${memoName}
    Press Keycode    4

onlyOpenApplication
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0.1    deviceName=3100d0646269b365    app=C:\\Users\\Andy\\Desktop\\My Diary.apk
    Wait Until Page Contains    確定
    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="下一步"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.Button[@text="確定"]
    Wait Until Page Contains Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_main_setting"]
