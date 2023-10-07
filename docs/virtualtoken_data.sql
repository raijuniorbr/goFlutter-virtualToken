-- SELECT UUID() 
-- 553469b4-6468-11ee-b72b-8bf7342003ad
-- 61b017ce-6468-11ee-b72b-8bf7342003ad
-- 6bacd3f2-6468-11ee-b72b-8bf7342003ad
-- 710d8dfa-6468-11ee-b72b-8bf7342003ad
-- 770d4916-6468-11ee-b72b-8bf7342003ad

-- Currency => Moedas
-- coluna idCurrenncy é AUTO
/*
INSERT INTO `virtualtoken`.`currency`
(
`currencyCode`,
`currencyName`,
`currencyDescription`)
VALUES
(
'BRL',
'REAL',
'REAL Brasileiro');

INSERT INTO `virtualtoken`.`currency`
(
`currencyCode`,
`currencyName`,
`currencyDescription`)
VALUES
(
'USD',
'US Dolar',
'Dolar americano');
*/

-- company
-- coluna idCompany é AUTO
/*
INSERT INTO `virtualtoken`.`company`
(
`companyName`,
`companyType`,
`companyNacionalID`,
`companyCountry`,
`companyState`,
`companyZipCode`,
`companyAddress`)
VALUES
(
'Company Mock 00',
'PJ',
'00000000000000',
'BRA',
'SAO PAULO',
'11111111',
'Avenida Um dois Três, 123');
==> Id = 1

INSERT INTO `virtualtoken`.`company`
(
`companyName`,
`companyType`,
`companyNacionalID`,
`companyCountry`,
`companyState`,
`companyZipCode`,
`companyAddress`)
VALUES
(
'Company Mock 01',
'PJ',
'01000000000101',
'BRA',
'SAO PAULO',
'11111112',
'Avenida Um dois Três, 234');
==> Id = 2
*/

-- customer
-- coluna idCustomer é AUTO
/*
INSERT INTO `virtualtoken`.`customer`
(
`customerName`,
`customerTypeDoc`,
`customerDoc`,
`company_idCompany`)
VALUES
(
'Customer Mock 00',
'CPF',
'11111111111',
1);
==> id = 1

INSERT INTO `virtualtoken`.`customer`
(
`customerName`,
`customerTypeDoc`,
`customerDoc`,
`company_idCompany`)
VALUES
(
'Customer Mock 01',
'CPF',
'22222222222',
1);
==> Id = 2

INSERT INTO `virtualtoken`.`customer`
(
`customerName`,
`customerTypeDoc`,
`customerDoc`,
`company_idCompany`)
VALUES
(
'Customer Mock 02',
'CPF',
'11111111111',
2);
==> Id = 3

INSERT INTO `virtualtoken`.`customer`
(
`customerName`,
`customerTypeDoc`,
`customerDoc`,
`company_idCompany`)
VALUES
(
'Customer Mock 03',
'CPF',
'22222222222',
2);
==> Id = 4
*/

-- account
-- coluna idAccount é AUTO
/*
INSERT INTO `virtualtoken`.`account`
(
`accountName`,
`accountBalance`,
`accountBalanceDateTime`,
`currency_idCurrency`,
`customer_idCustomer`)
VALUES
(
'Mock Default 0',
0.00,
NOW(),
1,
1);

INSERT INTO `virtualtoken`.`account`
(
`accountName`,
`accountBalance`,
`accountBalanceDateTime`,
`currency_idCurrency`,
`customer_idCustomer`)
VALUES
(
'Mock Default 1',
12000.76,
NOW(),
1,
1);


INSERT INTO `virtualtoken`.`account`
(
`accountName`,
`accountBalance`,
`accountBalanceDateTime`,
`currency_idCurrency`,
`customer_idCustomer`)
VALUES
(
'Mock Default 2',
0.00,
NOW(),
1,
2);
*/

-- select NOW();

/*
INSERT INTO `virtualtoken`.`mobileDevice`
(
`mobileDeviceName`,
`mobileDeviceType`,
`mobileDeviceManufacturer`,
`mobileDeviceIdMachine`,
`mobileDeviceOsVersion`,
`customer_idCustomer`,
`account_idAccount`,
`mobileDeviceGuid`)
VALUES
(
'Mock Default 0',
'SSM-900',
'SAMSUNG',
'6758867868568568567',
'13',
1,
1,
'553469b4-6468-11ee-b72b-8bf7342003ad');

*/