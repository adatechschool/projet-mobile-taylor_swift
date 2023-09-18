package controllers

import (
	"Back/initializers"
	"Back/models"

	"github.com/gin-gonic/gin"
)

func QuestionsCreate(c *gin.Context) {

	// Get data off req body

	var body struct {
		Name   string
		Region string
		Flag   string
	}

	c.Bind(&body)

	// Create a Question
	question := models.Question{Name: body.Name, Region: body.Region, Flag: body.Flag}

	result := initializers.DB.Create(&question)

	if result.Error != nil {
		c.Status(400)
		return
	}

	// Return it

	c.JSON(200, gin.H{
		"question": question,
	})
}

func QuestionsIndex(c *gin.Context) {
	// Get the Questions
	var questions []models.Question
	initializers.DB.Find(&questions)

	// Respond with that

	c.JSON(200, gin.H{
		"questions": questions,
	})
}

func QuestionsShow(c *gin.Context) {
	// Get id off URL
	id := c.Param("id")

	var question models.Question
	initializers.DB.First(&question, id)

	c.JSON(200, gin.H{
		"question": question,
	})
}

func QuestionsUpdate(c *gin.Context) {
	// Get the id off the URL
	id := c.Param("id")

	// Get the data off request body

	var body struct {
		Name   string
		Region string
		Flag   string
	}

	c.Bind(&body)

	// Find the Question we're updating

	var question models.Question
	initializers.DB.First(&question, id)

	// Update it

	initializers.DB.Model(&question).Updates(models.Question{
		Name:   body.Name,
		Region: body.Region,
		Flag:   body.Flag,
	})

	// Respond with it

	c.JSON(200, gin.H{
		"question": question,
	})
}

func QuestionsDelete(c *gin.Context) {
	// Get the id off the URL

	id := c.Param("id")

	// Delete the Questions

	initializers.DB.Delete(&models.Question{}, id)

	// Respond

	c.Status(200)
}
