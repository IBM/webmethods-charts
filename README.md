# IBM webMethods Helm Charts Repository

Repository containing Helm Charts for IBM webMethods products.

## :desktop_computer: User Interface

Each chart is browsable in the IBM webMethods Containers Portal:
https://containers.webmethods.io/charts

There you can find setup instructions, customizable Helm values, and chart README documentation.

## :computer: CLI Quickstart

```bash
helm repo add webMethods https://charts.webmethods.io
helm search repo webmethods
```

## Old Helm Charts

Older Helm Chart version can be found here:
- Website: https://ibm.github.io/webmethods-helm-charts
- GitHub: https://github.com/IBM/webmethods-helm-charts

## Developer Corner

- The Helm Chart description appearing in the boxes at https://containers.webmethods.io/charts comes from the Chart.yaml description field. The README.md file is not used.

- Help charts must be isolated and self-contained: libraries are not allowed to be published in this repository
