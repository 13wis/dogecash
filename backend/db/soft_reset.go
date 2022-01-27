package db

import (
	"log"

	"gorm.io/gorm"
)

func SoftResetDB(db *gorm.DB) {
	length := len(SeedDoges)
	if err := db.Exec("DELETE FROM doges WHERE id > ?", length).Error; err != nil {
		log.Fatal(err.Error())
	}
	if err := db.Exec("DELETE FROM activities WHERE id > ?", length*2).Error; err != nil {
		log.Fatal(err.Error())
	}
	if err := db.Exec("DELETE FROM my_doges WHERE dogee > ? OR doger > ?").Error; err != nil {
		log.Fatal(err.Error())
	}
}
