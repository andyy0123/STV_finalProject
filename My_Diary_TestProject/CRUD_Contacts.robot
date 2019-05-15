*** Settings ***
Suite Setup       suiteSetup
Suite Teardown    suiteTearDown
Library           AppiumLibrary
Resource          keywords/keyword.robot

*** Variables ***
${specialCharacter}    ,.?!@:;()*#

*** Test Cases ***
addOneContact
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    Jack    09123456789
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

contactNameWithSpecialCharacter
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    ${specialCharacter}    09123456789
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

contactPhoneNumberWithSpecialCharacter
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    Jack    09------
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

deleteContact
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    Jack    0912345678
    deleteContact    Jack
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

addContactNameWithThousandsCharacter
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_contacts_add"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_contacts_detail_name"]    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_contacts_detail_phone_number"]    09123456789
    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_contacts_detail_ok"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    aaaaaaaaaaaaa
    Page Should Contain Text    09123456789
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

addContactPhoneNumberWithThousandsCharacter
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.ImageView[@resource-id="com.kiminonawa.mydiary:id/IV_contacts_add"]
    Wait Until Keyword Succeeds    15s    1s    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_contacts_detail_name"]    Jack
    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_contacts_detail_phone_number"]    000000000000000000000000000000
    Click Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_contacts_detail_ok"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Text    Jack
    Page Should Contain Text    000000000000000000000000000000
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

sortContact
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    Jack    09123456789
    addOneContact    Mark    09223456789
    addOneContact    Andy    09323456789
    @{list}    Get Webelements    //android.support.v7.widget.RecyclerView[@resource-id="com.kiminonawa.mydiary:id/RecyclerView_contacts"]/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TextView
    Element Text Should Be    @{list}[0]    Andy
    Element Text Should Be    @{list}[1]    Jack
    Element Text Should Be    @{list}[2]    Mark
    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

editOneContact
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    Jack    09123456789
    editOneContact    Andy    0987654321
    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

searchContact
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addManyContacts
    Input Text    //android.widget.EditText[@resource-id="com.kiminonawa.mydiary:id/EDT_main_contacts_search"]    Jack
    Hide Keyboard
    Page Should Contain Text    Jack
    Page Should Contain Text    0912345678
    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1

callTheContact
    [Setup]    contactsSetup
    Wait Until Keyword Succeeds    15s    1s    Click Element    //android.widget.TextView[@text="contacts_1"]
    addOneContact    Jack    09123456789
    Click Element    //android.widget.TextView[@text="Jack"]
    Wait Until Keyword Succeeds    15s    1s    Page Should Contain Element    //android.widget.Button[@resource-id="com.kiminonawa.mydiary:id/But_contacts_call_call"]
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    Wait Until Keyword Succeeds    15s    1s    Press Keycode    4
    [Teardown]    deleteTopic    contacts_1
