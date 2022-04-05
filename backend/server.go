package main

import (
	"flag"
	"fmt"
	"log"
	"net"
	"os"
	"os/exec"
	"time"

	"github.com/briandowns/spinner"
	"github.com/joho/godotenv"
	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/rpc"
	"github.com/stripe/stripe-go/v72"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	_ = godotenv.Load()

	port := os.Getenv("PORT")
	if port == "" {
		port = "5001"
		log.Printf("Defaulting to port %s", port)
	}

	stripe.Key = os.Getenv("STRIPE_SECRET_KEY")

	stripe := flag.Bool("stripe", false, "flag for initiating the stripe CLI")
	seed := flag.Bool("seed", false, "flag for deleting all SQL and Strip data, seeding with new users")
	softreset := flag.Bool("soft-reset", false, "flag for resetting non-seeded DB entries")

	gorm := db.NewGormDB()
	s := spinner.New(spinner.CharSets[11], 100*time.Millisecond)

	flag.Parse()
	if *stripe {
		log.Println("\033[36mStarting stripe client in the background \033[m")
		s.Start()
		cmd := exec.Command("stripe", "listen", "--forward-to", ":"+port+"/stripeWebhooks")
		log.Println(cmd.Stderr)
	}

	if *seed {
		log.Println("\033[36mSeeding Stripe and DB accounts (this could take up to 5 minutes) \033[m")
		s.Start()
		db.SeedDBAndStripe(gorm)
	}

	if *softreset {
		len := fmt.Sprintf("%d", len(db.SeedDoges))
		log.Printf("\033[36mPerforming soft reset on DB ids > %s \033[m \n", len)
		s.Start()
		db.SoftResetDB(gorm)
	}

	s.Stop()

	lis, err := net.Listen("tcp", ":"+port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	grpcSrv := grpc.NewServer(grpc.UnaryInterceptor(interceptors.AddClaimsToContext))
	dogecash.RegisterDogecashServer(grpcSrv, rpc.NewServer(gorm))
	reflection.Register(grpcSrv)
	log.Printf("registered grpc server at port :%s", port)
	log.Fatal(grpcSrv.Serve(lis))
}
