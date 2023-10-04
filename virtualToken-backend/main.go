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
func main() {
	r := gin.Default()
	r.Use(cors.Default())
	r.GET("/accounts", companyAccountsHandler)
	r.Run(":5000")
}
