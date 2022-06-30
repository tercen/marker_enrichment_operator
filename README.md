# Marker Enrichment Score

##### Description

The `marker_enrichment_operator` computes a standardised metric to quantify
the relative enrichment of a marker / channel per group / cluster.

##### Usage

Input projection|.
---|---
`y-axis`        | numeric, measurement
`row`           | factor, variable (channel / marker)
`column`        | factor, group (cluster) 

Output relations|.
---|---
`score`        | enrichment score
`p_value`        | p-value
`neglog_p_value`        | -log10(p-value)

