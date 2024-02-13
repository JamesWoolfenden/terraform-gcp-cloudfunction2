package crushfunc

import (
	"encoding/json"
	"fmt"
	"github.com/GoogleCloudPlatform/functions-framework-go/functions"
	Crusher "github.com/JamesWoolfenden/crusher/src"
	"html"
	"net/http"
	"os"
)

func init() {
	functions.HTTP("HelloHTTP", helloHTTP)
}

// helloHTTP is an HTTP Cloud Function with a request parameter.
func helloHTTP(w http.ResponseWriter, r *http.Request) {

	var Chomp Crusher.Crusher

	if os.Getenv("InstanceID") != "" {
		Chomp.InstanceID = os.Getenv("InstanceID")
	} else {
		fmt.Fprint(w, "InstanceID not set")
		return
	}

	if os.Getenv("TableID") != "" {
		Chomp.TableID = os.Getenv("TableID")
	} else {
		fmt.Fprint(w, "TableID not set")
		return
	}

	fmt.Fprintf(w, "InstanceID %s \n", Chomp.InstanceID)
	fmt.Fprintf(w, "TableID %s \n", Chomp.TableID)

	rows, err := Chomp.ReadWithFilter()

	fmt.Fprintf(w, "Rows %s \n", rows)
	if err != nil {
		fmt.Fprintf(w, "Err: %s \n", err)
		fmt.Println(`{"message": "Error"}`)
	}

	fmt.Println(`{"message": "This has ERROR severity", "severity": "error"}`)
	var d struct {
		Name string `json:"name"`
	}
	if err := json.NewDecoder(r.Body).Decode(&d); err != nil {
		fmt.Fprint(w, "Hello, World!")
		return
	}
	if d.Name == "" {
		fmt.Fprint(w, "Hello, World!")
		return
	}
	fmt.Fprintf(w, "Hello, %s!", html.EscapeString(d.Name))
}
