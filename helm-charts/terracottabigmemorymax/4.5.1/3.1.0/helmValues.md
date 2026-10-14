# terracottabigmemorymax

![Version: 3.1.0](https://img.shields.io/badge/Version-3.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.5.1](https://img.shields.io/badge/AppVersion-4.5.1-informational?style=flat-square)

Terracotta BigMemory Max Helm Chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraEnvs | string | `nil` |  |
| extraLabels | object | `{}` | Extra Labels |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[{"name":"regcred"}]` | Image pull secret reference. By default looks for `regcred`. |
| prometheus | object | `{"interval":"10s","path":"/tmc/api/prometheus","scrapeTimeout":"10s"}` | Define values for Prometheus Operator to scrap metrics via ServiceMonitor. |
| pullPolicy | string | `"IfNotPresent"` |  |
| resources | object | `{}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. If you do want to specify resources, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'resources:'.  tsaContainer:   limits:     cpu: 100m     memory: 128Mi   requests:     cpu: 100m     memory: 128Mi tmcContainer:   requests:     cpu: 500m     memory: 2Gi   limits:     # use a high cpu limit to avoid the container being throttled     cpu: 8     memory: 4Gi |
| securityContext.fsGroup | int | `0` |  |
| securityContext.runAsGroup | int | `0` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1724` |  |
| serverImage | string | `"ibmwebmethods.azurecr.io/bigmemorymax-server"` | The repository for the image. By default, this points to the IBM webMethodscontainer repository. Change this for air-gaped installations or custom images. For the IBM webMethods container repository you need to have a valid access token stored as registry credentials |
| serverStorage | string | `"10Gi"` | The pvc storage request for the server pods |
| serviceMonitor | object | `{"enabled":false}` | Create and enable ServiceMonitor. The default is `false`. |
| tag | string | `"4.5.1"` | Specific version to not accidentally change production versions with newer images. |
| terracotta | object | `{"datastoreSize":"4G","jsonLogging":true,"nodeCountPerStripe":2,"offHeapSize":"2G","restartable":false,"secretName":"","security":false,"selfSignedCerts":true,"serverOpts":"","serviceAccountName":"","stripeCount":1,"tmcEnabled":true,"tmcManagementPort":9889,"tmcOpts":"","tmcSecurePort":9443,"tsaGroupPort":9530,"tsaManagementPort":9540,"tsaPort":9510}` | Terracotta BigMemoryMax configurations |
| terracotta.datastoreSize | string | `"4G"` | The <datastoreSize> configuration for each Terracotta server. |
| terracotta.jsonLogging | bool | `true` | The JSON_LOGGING environment variable for each Terracotta server. |
| terracotta.nodeCountPerStripe | int | `2` | The number of Terracotta servers per stripe. |
| terracotta.offHeapSize | string | `"2G"` | The <offheap> configuration for each Terracotta server. |
| terracotta.restartable | bool | `false` | The <restartable> configuration for each Terracotta server. |
| terracotta.secretName | string | `""` | Create a secret manually in cluster which contains all the necessary certs, files etc. for all the servers as well as tmc as the same secret will be mounted to all the pods deployed via this helm chart. |
| terracotta.security | bool | `false` | Add the <security> configuration for each Terracotta server. Requires secretName to be set. |
| terracotta.selfSignedCerts | bool | `true` | Configure JAVA_OPTS appropriately when using self-signed certificates. |
| terracotta.serverOpts | string | `""` | Can be used for passing some jvm related options for terracotta servers. |
| terracotta.serviceAccountName | string | `""` | ServiceAccountName for the terracotta related pods |
| terracotta.stripeCount | int | `1` | The number of Terracotta stripes to deploy. |
| terracotta.tmcEnabled | bool | `true` | TMC Enabled or not |
| terracotta.tmcManagementPort | int | `9889` | TMC Management Port |
| terracotta.tmcOpts | string | `""` | Can be used for passing some jvm related options for tmc. |
| terracotta.tmcSecurePort | int | `9443` | TMC Secure Port |
| terracotta.tsaGroupPort | int | `9530` | TSA group port |
| terracotta.tsaManagementPort | int | `9540` | TSA Management port |
| terracotta.tsaPort | int | `9510` | TSA port |
| tmcImage | string | `"ibmwebmethods.azurecr.io/bigmemorymax-management-server"` |  |
| tmcServer | object | `{"affinity":null,"livenessProbe":{"failureThreshold":3,"initialDelaySeconds":20,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9889},"timeoutSeconds":5},"readinessProbe":{"failureThreshold":3,"initialDelaySeconds":20,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9889},"timeoutSeconds":5},"startupProbe":{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9889},"timeoutSeconds":5},"topologySpreadConstraints":null}` | TMC-specific configurations for probes |
| tmcServer.affinity | string | `nil` | Configure pod affinity for tms server |
| tmcServer.livenessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":20,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9889},"timeoutSeconds":5}` | Configure liveness probe |
| tmcServer.readinessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":20,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9889},"timeoutSeconds":5}` | Configure readiness probe |
| tmcServer.startupProbe | object | `{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9889},"timeoutSeconds":5}` | Configure startup probe |
| tmcServer.topologySpreadConstraints | string | `nil` | Configure pod topologySpreadConstraints for tms server |
| tmcStorage | string | `"1Gi"` | The pvc storage request for the tmc pods |
| tsaServer | object | `{"affinity":null,"livenessProbe":{"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9530},"timeoutSeconds":5},"readinessProbe":{"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9530},"timeoutSeconds":5},"startupProbe":{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":5,"successThreshold":1,"tcpSocket":{"port":9530},"timeoutSeconds":5},"topologySpreadConstraints":null}` | TSA container-specific configurations for probes |
| tsaServer.affinity | string | `nil` | Configure pod affinity for terracotta servers |
| tsaServer.livenessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9530},"timeoutSeconds":5}` | Configure liveness probe |
| tsaServer.readinessProbe | object | `{"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"tcpSocket":{"port":9530},"timeoutSeconds":5}` | Configure readiness probe |
| tsaServer.startupProbe | object | `{"failureThreshold":3,"initialDelaySeconds":10,"periodSeconds":5,"successThreshold":1,"tcpSocket":{"port":9530},"timeoutSeconds":5}` | Configure startup probe |
| tsaServer.topologySpreadConstraints | string | `nil` | Configure pod topologySpreadConstraints for terracotta servers |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
