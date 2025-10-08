package test

import (
	"fmt"
	"strings"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestAzureDataShareModule(t *testing.T) {
	t.Parallel()

	// create unique suffix so tests don't collide
	suffix := "go"
	rgName := fmt.Sprintf("rg-terratest-%s", suffix)
	dataShareName := fmt.Sprintf("ds-terratest-%s", suffix)
	// scheduleName := fmt.Sprintf("sched-terratest-%s", suffix)
	// RFC3339-ish timestamp for snapshot_start_time
	// snapshotStart := time.Now().UTC().Add(1 * time.Hour).Format(time.RFC3339)

	terraformOptions := &terraform.Options{
		// Path to the example usage of the module
		TerraformDir: "../examples/simple",

		Vars: map[string]interface{}{
			"resource_group_name": rgName,
			"location":            "centralindia",
			"data_share_name":     dataShareName,

			// module tags/metadata
			"environment":      "DEV",
			"application_name": "devwithkrishna",
			"temporary":        "TRUE",

			// // share-specific args (safe defaults)
			// "share_name":        dataShareName,
			// "share_type":        "CopyBased",
			// "share_description": "Terratest-created data share",
			// "datashare_terms":   "Test terms",

			// snapshot schedule (the module's validation requires a value)
			// "snapshot_schedule_name": scheduleName,
			// "snapshot_recurrence":    "Hour",
			// "snapshot_start_time":    snapshotStart,
		},

		// Retry settings: Azure sometimes needs extra time for provisioning
		MaxRetries:         3,
		TimeBetweenRetries: 10 * time.Second,
	}

	// ensure cleanup
	defer terraform.Destroy(t, terraformOptions)

	// init + apply
	terraform.InitAndApply(t, terraformOptions)

	// read outputs
	rgOut := terraform.Output(t, terraformOptions, "azure_datashare_rg")
	dsNameOut := terraform.Output(t, terraformOptions, "datashare_name")
	dsIDOut := terraform.Output(t, terraformOptions, "datashare_id")

	t.Logf("Outputs: rg=%s, datashare=%s, id=%s", rgOut, dsNameOut, dsIDOut)

	// basic assertions
	assert.Equal(t, rgName, rgOut)
	assert.Equal(t, dataShareName, dsNameOut)
	assert.NotEmpty(t, dsIDOut)
	assert.True(t, strings.Contains(dsIDOut, "/resourceGroups/"))
}
