package models

import "gorm.io/gorm"

type Question struct {
	gorm.Model
	Name   string
	Region string
	Flag   string
}
