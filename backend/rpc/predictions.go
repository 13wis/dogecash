package rpc

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"

	dogecash "github.com/l3wis/dogecash/proto"
)

type FeatureInfo struct {
	PlaceName string `json:"place_name"`
}

type Info struct {
	Features []FeatureInfo
}

func (s *DogecashServer) Predictions(stream dogecash.Dogecash_PredictionsServer) error {
	for {
		res := &dogecash.PredictionsResponse{}
		req, err := stream.Recv()
		if err != nil {
			return err
		}
		if req != nil {
			mapbox := os.Getenv("MAPBOX_KEY")
			parsed := url.QueryEscape(req.Input)
			url := fmt.Sprintf("https://api.mapbox.com/geocoding/v5/mapbox.places/%s.json?access_token=%s", parsed, mapbox)
			resp, err := http.Get(url)
			if err != nil {
				return err
			}

			body, err := ioutil.ReadAll(resp.Body)
			if err != nil {
				return err
			}

			var info Info
			if err := json.Unmarshal(body, &info); err != nil {
				return err
			}

			var list []string
			for _, feature := range info.Features {
				list = append(list, feature.PlaceName)
			}

			res.Description = list
			stream.SendMsg(res)
		}
	}
}
