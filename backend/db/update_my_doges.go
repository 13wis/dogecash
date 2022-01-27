package db

import (
	"gorm.io/gorm"
)

func UpdateMyDoges(dogee int64, doger int64, interaction string, db *gorm.DB) (err error) {
	myDoges := &MyDoges{Dogee: dogee, Doger: doger, InteractionType: interaction}
	tx := db.Table("my_doges").
		Where("dogee = ? AND doger = ?", dogee, doger).
		Update("interaction_type", interaction)
	if tx.Error != nil {
		return tx.Error
	}
	if tx.RowsAffected == 0 {
		err = db.Create(&myDoges).Error
	}
	return
}
