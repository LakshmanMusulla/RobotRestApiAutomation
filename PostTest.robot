*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseurl}    https://reqres.in

*** Test Cases ***
PostCall:CreateUser
   create session    postsession    ${baseurl}
   ${body}=    create dictionary    name=lakshman    job=sdet
   ${header}=    create dictionary    Content-Type=application/json
   ${response}=    post request    postsession    /api/users    data=${body}    headers=${header}

   log to console    ${response.status_code}

   ${statuscode}=   convert to string    ${response.status_code}
   should be equal    ${statuscode}    201

   log to console    ${response.content}
   ${res_body}=    convert to string  ${response.content}
   should contain    ${res_body}  lakshman
