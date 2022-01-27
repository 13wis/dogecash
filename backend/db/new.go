package db

import (
	"log"
	"os"

	proxy "github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/mysql"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func NewGormDB() *gorm.DB {
	var (
		user                   = os.Getenv("DB_USER")
		pass                   = os.Getenv("DB_PASS")
		instanceConnectionName = os.Getenv("INSTANCE_CONNECTION_NAME")
		dbName                 = os.Getenv("DB_NAME")
	)

	cfg := proxy.Cfg(instanceConnectionName, user, pass)
	cfg.DBName = dbName
	db, err := proxy.DialCfg(cfg)
	if err != nil {
		log.Fatal(err.Error())
	}

	// For deployed cloud run connections
	// socketDir, isSet := os.LookupEnv("DB_SOCKET_DIR")
	// if !isSet {
	// 	socketDir = "cloudsql"
	// }
	//
	// dsn := fmt.Sprintf("%s:%s@unix(/%s/%s)/%s?parseTime=true", user, pass, socketDir, instanceConnectionName, dbName)
	// db, err := sql.Open("mysql", dsn)
	// if err != nil {
	// 	log.Fatal(err.Error())
	// }

	config := mysql.New(mysql.Config{
		Conn: db,
	})
	gorm, err := gorm.Open(config, &gorm.Config{})
	if err != nil {
		log.Fatal(err.Error())
	}

	return gorm
}
