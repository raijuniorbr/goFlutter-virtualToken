package main

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

type CompanyAccount struct {
	Id          int    `json:"id"`
	AccountName string `json:"accountName"`
	AccountKey  string `json:"accountKey"`
	AccountUrl  string `json:"accountUrl"`
	//Price       int    `json:"price"`
	//Description string `json:"description"`
}

/*
  String deviceId;
  String secretKeyURL;
  String secretKey;
  String accountName;
  String? virtualTotp;
  bool? delete;
*/

type DeviceToken struct {
	DeviceId     string `json:"deviceId"`
	SecretKeyURL string `json:"secretKeyURL"`
	SecretKey    string `json:"secretKey"`
	AccountName  string `json:"accountName"`
}

func companyAccountsHandler(c *gin.Context) {
	accounts := []CompanyAccount{
		{100, "Conta corrente principal", "wwqerqwejklj34523523452354", "http://url1"},
		{101, "Conta corrente pj", "EREFGEEGER45643456dfgsdfgdgf", "http://url2"},
		{101, "Conta investimento", "RETEFSDFSD456645654DFGFDGDF443535", "http://url3"},
	}
	c.JSON(200, gin.H{
		"accounts": accounts,
	})
}

func deviceTokensHandler(c *gin.Context) {
	deviceTokens := []DeviceToken{
		{"553469b4-6468-11ee-b72b-8bf7342003ad", "http://MacBookRaiJr.local:5000/accounts", "YRXVKXETDFHQXABO", "Mock Default 0"},
		{"61b017ce-6468-11ee-b72b-8bf7342003ad", "http://MacBookRaiJr.local:5000/accounts", "YRXVKXETDFHQXABO", "Mock Default 1"},
		{"6bacd3f2-6468-11ee-b72b-8bf7342003ad", "http://MacBookRaiJr.local:5000/accounts", "YRXVKXETDFHQXABO", "Mock Default 2"},
		{"710d8dfa-6468-11ee-b72b-8bf7342003ad", "http://MacBookRaiJr.local:5000/accounts", "YRXVKXETDFHQXABO", "Mock Default 3"},
		{"770d4916-6468-11ee-b72b-8bf7342003ad", "http://MacBookRaiJr.local:5000/accounts", "YRXVKXETDFHQXABO", "Mock Default 4"},
	}
	c.JSON(200, gin.H{
		"deviceTokens": deviceTokens,
	})
}

func main() {
	r := gin.Default()
	r.Use(cors.Default())
	r.GET("/accounts", companyAccountsHandler)
	r.GET("/deviceTokens", deviceTokensHandler)
	r.Run(":5000")
}
