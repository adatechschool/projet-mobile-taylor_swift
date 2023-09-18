package main

import (
	"Back/controllers"
	"Back/initializers"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
}

func main() {
	r := gin.Default()

	r.POST("/questions", controllers.QuestionsCreate)
	r.PUT("/questions/:id", controllers.QuestionsUpdate)
	r.GET("/questions", controllers.QuestionsIndex)
	r.GET("/questions/:id", controllers.QuestionsShow)
	r.DELETE("/questions/:id", controllers.QuestionsDelete)

	r.Run() // listen and serve on 0.0.0.0:8080
}
