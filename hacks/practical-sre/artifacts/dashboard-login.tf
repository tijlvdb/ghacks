resource "google_monitoring_dashboard" "login_dashboard" {
  project        = var.gcp_project_id
  dashboard_json = <<EOF
  {
    "displayName": "MovieGuru-Login-Dashboard",
    "mosaicLayout": {
      "columns": 48,
      "tiles": [
        {
          "width": 24,
          "height": 16,
          "widget": {
            "xyChart": {
              "dataSets": [
                {
                  "timeSeriesQuery": {
                    "prometheusQuery": "(sum(rate(movieguru_login_success_total[$${__interval}])) / sum(rate(movieguru_login_attempts_total[$${__interval}]))) * 100",
                    "unitOverride": "%",
                    "outputFullDuration": false
                  },
                  "plotType": "LINE",
                  "legendTemplate": "",
                  "targetAxis": "Y1",
                  "dimensions": [],
                  "measures": [],
                  "breakdowns": []
                }
              ],
              "thresholds": [],
              "yAxis": {
                "label": "",
                "scale": "LINEAR"
              },
              "chartOptions": {
                "mode": "COLOR",
                "showLegend": false,
                "displayHorizontal": false
              }
            },
            "title": "Login Success Rate",
            "id": ""
          }
        },
        {
          "yPos": 16,
          "width": 24,
          "height": 16,
          "widget": {
            "xyChart": {
              "dataSets": [
                {
                  "timeSeriesQuery": {
                    "prometheusQuery": "histogram_quantile(0.1, sum(rate(movieguru_login_latency_milliseconds_bucket[$${__interval}])) by (le))\n",
                    "unitOverride": "ms",
                    "outputFullDuration": false
                  },
                  "plotType": "LINE",
                  "legendTemplate": "",
                  "targetAxis": "Y1",
                  "dimensions": [],
                  "measures": [],
                  "breakdowns": []
                },
                {
                  "timeSeriesQuery": {
                    "prometheusQuery": "histogram_quantile(0.5, sum(rate(movieguru_login_latency_milliseconds_bucket[$${__interval}])) by (le))\n",
                    "unitOverride": "ms",
                    "outputFullDuration": false
                  },
                  "plotType": "LINE",
                  "legendTemplate": "",
                  "targetAxis": "Y1",
                  "dimensions": [],
                  "measures": [],
                  "breakdowns": []
                },
                {
                  "timeSeriesQuery": {
                    "prometheusQuery": "histogram_quantile(0.9, sum(rate(movieguru_login_latency_milliseconds_bucket[$${__interval}])) by (le))\n",
                    "unitOverride": "ms",
                    "outputFullDuration": false
                  },
                  "plotType": "LINE",
                  "legendTemplate": "",
                  "targetAxis": "Y1",
                  "dimensions": [],
                  "measures": [],
                  "breakdowns": []
                },
                {
                  "timeSeriesQuery": {
                    "prometheusQuery": "histogram_quantile(0.95, sum(rate(movieguru_login_latency_milliseconds_bucket[$${__interval}])) by (le))\n",
                    "unitOverride": "ms",
                    "outputFullDuration": false
                  },
                  "plotType": "LINE",
                  "legendTemplate": "",
                  "targetAxis": "Y1",
                  "dimensions": [],
                  "measures": [],
                  "breakdowns": []
                },
                {
                  "timeSeriesQuery": {
                    "prometheusQuery": "histogram_quantile(0.99, sum(rate(movieguru_login_latency_milliseconds_bucket[$${__interval}])) by (le))\n",
                    "unitOverride": "ms",
                    "outputFullDuration": false
                  },
                  "plotType": "LINE",
                  "legendTemplate": "",
                  "targetAxis": "Y1",
                  "dimensions": [],
                  "measures": [],
                  "breakdowns": []
                }
              ],
              "thresholds": [],
              "yAxis": {
                "label": "",
                "scale": "LINEAR"
              },
              "chartOptions": {
                "mode": "COLOR",
                "showLegend": false,
                "displayHorizontal": false
              }
            },
            "title": "Login Latency",
            "id": ""
          }
        }
      ]
    },
    "dashboardFilters": [],
    "labels": {}
  }
  
  EOF
    depends_on = [ google_monitoring_dashboard.chat_dashboard ]

}