package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/gorilla/mux"
)

var err error

func check(err error) {
	if err != nil {
		fmt.Println(err)
	}
}

type people struct {
	Fname string
	Lname string
	Items []string
}
type image struct {
	Width, Height int
	Title         string
	Thumbnail     thumbnail
	Animated      bool
	IDs           []int
}
type thumbnail struct {
	Url           string
	Height, Width int
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/mar", mar).Methods("GET")
	r.HandleFunc("/unmar", unmar).Methods("GET")
	r.HandleFunc("/enc", enc).Methods("GET")
	r.HandleFunc("/dec", dec).Methods("GET")
	err = http.ListenAndServe(":8080", r)
	check(err)
}
func mar(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-type", "application/json")
	p1 := people{
		Fname: "張",
		Lname: "鈞晏",
	}
	bs, err := json.Marshal(p1)
	check(err)
	w.Write(bs)
}
func unmar(w http.ResponseWriter, r *http.Request) {
	var img image
	data1 := `{
			"Width":  800,
			"Height": 600,
			"Title":  "View from 15th Floor",
			"Thumbnail": {
				"Url":    "http://www.example.com/image/481989943",
				"Height": 125,
				"Width":  100
			},
			"Animated" : false,
			"IDs": [116, 943, 234, 38793]
		}`
	err = json.Unmarshal([]byte(data1), &img)
	check(err)
	for i, v := range img.IDs {
		fmt.Println(i, v)
	}
	fmt.Println(img)
}
func enc(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-type", "application/json")
	p2 := people{
		Fname: "張",
		Lname: "鈞晏",
		Items: []string{"ABC", "efg"},
	}
	en := json.NewEncoder(w)
	err := en.Encode(p2)
	check(err)
}
func dec(w http.ResponseWriter, r *http.Request) {
	var img image
	data2 := `{
		"Width":  800,
		"Height": 600,
		"Title":  "View from 15th Floor",
		"Thumbnail": {
			"Url":    "http://www.example.com/image/481989943",
			"Height": 125,
			"Width":  100
		},
		"Animated" : false,
		"IDs": [116, 943, 234, 38793]
	}`
	de := json.NewDecoder(strings.NewReader(data2))
	err := de.Decode(&img)
	check(err)
	for i, v := range img.IDs {
		fmt.Println(i, v)
	}
	fmt.Println(img)
}
