# Marker Enrichment Score

### Description

The marker enrichment score is a standardised metric to quantify the relative enrichment of a marker (higher expression) in a cluster. 

### Usage

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


### Details

The score is computed as follows:

$$Z_{\text{ME}} = 0.6745 \times \frac{m_{cluster} - m_{marker}}{MAD},$$

where:
* $m_{cluster}$ is the median marker intensity of a given cluster.
* $m_{marker}$ mmarker is the median marker intensity across clusters.
* $MAD$ is the Median Absolute Deviation of the measurement for a given marker-cluster combination. If the number of data points is below 10, the MAD computed across clusters will be used as its estimation would be inaccurate.
* $0.6745$ is a scaling constant that allows one to interpret this metric as a conventional Z-score.

For interpretability, the score is arbitrarily restricted to the range [-20, 20], i.e. values outside the range are set to the closest limit.

__Interpretation__: The score is centered around zero. A positive value indicates that the cluster has a marker intensity that is above the marker average computed across clusters. A negative value indicates a below-average marker intensity. Values are expressed in units of Median Absolute Deviation (MAD).
