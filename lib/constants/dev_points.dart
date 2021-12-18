// ignore_for_file: constant_identifier_names

const QA_DOMAIN = "https://qa.api.keysave.qualitapps.com";
const UAT_DOMAIN = "https://uat.api.keysave.qualitapps.com";

const DOMAIN = QA_DOMAIN;

//Base url
const API_BASE = DOMAIN + "/api/";

const LOGIN = "https://gyma-api.herokuapp.com/api/customer.php";
const PASSWORD_RESET = API_BASE + "Users/ForgotPassword";
const PASSWORD_CHANGE = API_BASE + "Users/FirstLoginPasswordChange";

const FIREBASE_TOKEN_UPDATE = API_BASE + "Users/UpdateUserToken";

const CLIENT_USERS_LIST = API_BASE + "Users/GetClientUserList/";
const CLIENT_USER_DETAILS = API_BASE + "Users/GetUserDetailsById/";
const CLIENT_USER_SAVE = API_BASE + "Users/SaveClientUser";

const KEY_LIST = API_BASE + "Key/GetLockerKeyList/";
const KEY_BY_ID = API_BASE + "Key/GeKeyById/";
const KEY_ASSIGN = API_BASE + "KeyUserHistory/AssigningKey";
// const KEY_ASSIGN =
//     "https://eb89-2402-d000-a400-8039-541d-a844-695-9aed.ngrok.io/api/KeyUserHistory/AssigningKey";
const KEY_UNASSIGN = API_BASE + "KeyUserHistory/UnAssigningKey";

const EVENTS_LIST = API_BASE + "Event/GetEventList";

const GET_REPORTS = API_BASE + "Event/GetReport";
const GET_USERS_LIST = API_BASE + "Users";
const SAVE_USER_IMAGE = API_BASE + "upload/file";
const GET_USER_BY_ID = API_BASE + "Users/GetUserById/";
const GET_USER_DETAILS_BY_ID = API_BASE + "Users/GetUserDetailsById/";
