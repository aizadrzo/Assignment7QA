*** Settings ***
Library     SeleniumLibrary

*** Keyword ***
Login
    [arguments]     ${my_email}     ${my_pw}
    maximize browser window
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    name=email         15
    input text      name=email      ${my_email}
    input text      name=password   ${my_pw}
    click element   name=login

CheckBox Test
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    element should be enabled     //*[text()="Read"]//parent::label
    click element  //*[text()="Trade"]//parent::label
    element should be enabled     //*[text()="Trade"]//parent::label
    click element   //*[text()="Payments"]//parent::label
    element should be enabled     //*[text()="Payments"]//parent::label
    click element   //*[text()="Admin"]//parent::label
    element should be enabled     //*[text()="Admin"]//parent::label
    click element   //*[text()="Trading information"]//parent::label
    element should be enabled     //*[text()="Trading information"]//parent::label

Btn Test
# scenario 1
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
# scenario 2
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

#scenario 3
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    press keys      name=token_name     test
    element should be enabled       //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

Character TextBox Test
# scenario 1: 1 char
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    press keys      name=token_name     a
    element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]


# scenario 2: 2 char
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    press keys      name=token_name     ab
    element should be enabled       //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

# scenario 3: 32 char
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    press keys      name=token_name     lSKsZTzlProoAR0jdSeOhoGP_n3hSXUw
    element should be enabled       //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

# scenario 4: 33 char
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    press keys      name=token_name     Z3uLTGsCo1wI95iCq8LHYzO6bcik24Z4i
    element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

# scenario 5: special char
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    press keys      name=token_name     !@#$%^&*(){}+|\:"<>?~
    element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

Results Test
#scenario 1
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    click element  //*[text()="Trade"]//parent::label
    press keys     name=token_name   test1
    click element   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

#scenario 2
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Payments"]//parent::label
    click element   //*[text()="Admin"]//parent::label
    click element   //*[text()="Trading information"]//parent::label
    press keys     name=token_name   test2
    click element   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

#scenario 3: test for unique token
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[text()="Read"]//parent::label
    click element  //*[text()="Trade"]//parent::label
    press keys     name=token_name   test1
    click element   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

#scenario 4: test delete button for results row
    reload page
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element   //*[@class="dc-btn dc-btn--secondary dc-btn__small"]https://media.geeksforgeeks.org/wp-content/uploads/20200520000614/f39.png
    click element   //*[text()="Yes"]//parent::button

*** Test Cases ***
Day 7 Assignment
    Open Browser    https://app.deriv.com/account/api-token    chrome
    Login   ${my_email}     ${my_pw}
    CheckBox Test
    Btn Test
    Character TextBox Test
    Results Test



