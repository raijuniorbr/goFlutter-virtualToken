/// GlobalVars
///
/// CONSTANTS and Global Variables for this project
///

// Routes of the project
const routeHome = '/';
const routeSettings = '/settings';
const routePrefixDeviceSetup = '/setup/';
const routeDeviceSetupStart = '/setup/$routeDeviceSetupStartPage';
const routeDeviceSetupStartPage = 'find_devices';
const routeDeviceSetupSelectDevicePage = 'select_device';
const routeDeviceSetupConnectingPage = 'connecting';
const routeDeviceSetupFinishedPage = 'finished';
const routeTokenActivate = '/token_activate';
const routeTokenGenerator = '/token_generator';
const routeQRView = '/token/qrViewCCB';
const routeListTokens = '/token/ListTokens';
const routeShowAlert = '/common/show_alert';

/// Default colors
const colorBlueCCB = 0xFF005CA9;

/// Size of the icons
const double iconSizeCCB = 48;

///--------------------------------------
/// Sessão para DEBUG e MOCKs
///
bool debugMode = true;
bool mockReset = false;
bool mockPopListTokens = false;

const jsonTokensDefault =
    '{"deviceId": "553469b4-6468-11ee-b72b-8bf7342003ad", "accountName": "Mock Default 0", "secretKeyURL": "http://MacBookRaiJr.local:5000/accounts","secretKey":"YRXVKXETDFHQXABO", "virtualTotp": ""}';
const jsonTokenMock = '['
    '{"deviceId": "61b017ce-6468-11ee-b72b-8bf7342003ad", "accountName": "Mock Default 1", "secretKeyURL": "http://MacBookRaiJr.local:5000/accounts","secretKey":"YRXVKXETDFHQXABO", "virtualTotp": ""},'
    '{"deviceId": "6bacd3f2-6468-11ee-b72b-8bf7342003ad", "accountName": "Mock Default 2", "secretKeyURL": "http://MacBookRaiJr.local:5000/accounts","secretKey":"YRXVKXETDFHQXABO", "virtualTotp": ""},'
    '{"deviceId": "710d8dfa-6468-11ee-b72b-8bf7342003ad", "accountName": "Mock Default 3", "secretKeyURL": "http://MacBookRaiJr.local:5000/accounts","secretKey":"YRXVKXETDFHQXABO", "virtualTotp": ""},'
    '{"deviceId": "770d4916-6468-11ee-b72b-8bf7342003ad", "accountName": "Mock Default 4", "secretKeyURL": "http://MacBookRaiJr.local:5000/accounts","secretKey":"YRXVKXETDFHQXABO", "virtualTotp": ""}'
    ']';

///--------------------------------------
/// Constants auxiliares
///

const logsDefault = '[{"timestamp":"2000-01-01 00:00:00.000000","mensagem":""}]';
const versaoapp = 'beta';
const int timeOutCadastrarDispositivo = 20;

String? tokenCCB = '';
List<String>? tokenCCBList = [tokenCCB!, ''];
String? tokenUsuarioCCB = '';
String? usuarioTokenCCB = '';
//String? jsonTokens = '[$jsonTokensDefault]';
String? jsonTokens = jsonTokenMock;
String? logsApp;
int tokenPeriod = 60; // Segundos
