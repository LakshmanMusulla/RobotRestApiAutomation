*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${baseurl}    https://www.metaweather.com
${city}    london


*** Test Cases ***
GetWoeid
  create session    getsession    ${baseurl}
  ${response}=    get request    getsession    /api/location/search/?query=${city}
  log to console    ${response.status_code}
  log to console    ${response.content}
  log to console    ${response.headers}

  ${statuscode}=   convert to string    ${response.status_code}
  should be equal    ${statuscode}    200

  ${content}=    convert to string    ${response.content}
  should contain    ${content}    London
  should contain    ${content}    44418

  ${TypeValue}=    get from dictionary    ${response.headers}    Content-Type
  should be equal    ${TypeValue}    application/json