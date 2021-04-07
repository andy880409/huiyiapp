package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

var err error

type user struct {
	Id     string `json:"Id"`
	Name   string `json:"name"`
	Number int    `json:"number"`
}

func main() {
	http.HandleFunc("/", index)
	err = http.ListenAndServe(":8080", nil)
	check(err)
}
func check(err error) {
	if err != nil {
		fmt.Println(err.Error())
	}
}
func index(w http.ResponseWriter, r *http.Request) {
	newUser := user{
		Id:     "a123",
		Name:   "Andy",
		Number: 987994967,
	}
	json.NewEncoder(w).Encode(newUser)
}
