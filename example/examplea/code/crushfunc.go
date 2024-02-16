package crushfunc

import (
	"encoding/json"
	"fmt"
	"github.com/GoogleCloudPlatform/functions-framework-go/functions"
	Crusher "github.com/JamesWoolfenden/crusher/src"
	"net/http"
)

func init() {
	functions.HTTP("btDeleter", btDeleter)
}

// btDeleter is an HTTP Cloud Function with a request parameter.
func btDeleter(w http.ResponseWriter, r *http.Request) {

	var Chomp Crusher.Crusher

	var d struct {
		ProjectID  string `json:"projectid"`
		InstanceID string `json:"instanceid"`
		TableID    string `json:"tableid"`
		Filter     string `json:"filter"`
		Days       int    `json:"days"`
		DryRun     bool   `json:"dryrun"`
	}

	if err := json.NewDecoder(r.Body).Decode(&d); err != nil {
		fmt.Fprint(w, "Hello, World!  \n")
		return
	}

	if d.ProjectID != "" {
		Chomp.ProjectID = d.ProjectID
	} else {
		fmt.Fprint(w, "ProjectID not set")
		return
	}

	if d.InstanceID != "" {
		Chomp.InstanceID = d.InstanceID
	} else {
		fmt.Fprint(w, "InstanceID not set")
		return
	}

	if d.TableID != "" {
		Chomp.TableID = d.TableID
	} else {
		fmt.Fprint(w, "TableID not set")
		return
	}

	if d.Filter != "" {
		Chomp.KeyFilter = d.Filter
	} else {
		fmt.Fprint(w, "KeyFilter not set")
		return
	}

	Chomp.Days = d.Days
	Chomp.DryRun = d.DryRun

	fmt.Fprintf(w, "ProjectID %s \n", Chomp.ProjectID)
	fmt.Fprintf(w, "InstanceID %s \n", Chomp.InstanceID)
	fmt.Fprintf(w, "TableID %s \n", Chomp.TableID)
	fmt.Fprintf(w, "Filter %s \n", Chomp.KeyFilter)
	fmt.Fprintf(w, "Days %d \n", Chomp.Days)
	fmt.Fprintf(w, "Dryrun %t \n", Chomp.DryRun)

	rows, err := Chomp.Clip()

	fmt.Fprintf(w, "%d rows deleted \n", rows)
	fmt.Printf(`{"message": "This has WARNING severity %d rows deleted", "severity": "warning"}`, rows)

	if err != nil {
		fmt.Fprintf(w, "Err: %s \n", err)
		fmt.Println(`{"message": "Error"}`)
	}
}
