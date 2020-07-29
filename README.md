- [Balena live-push can't find ENV](#balena-live-push-cant-find-env)
  - [balena push 0eb3102.local -c --build-arg NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug](#balena-push-0eb3102local--c---build-arg-npm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug)
  - [balena push 0eb3102.local -c --build-arg NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug](#balena-push-0eb3102local--c---build-arg-npm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug-1)
  - [balena push 0eb3102.local -c --build-arg main:NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug](#balena-push-0eb3102local--c---build-arg-mainnpm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug)
  - [balena push 0eb3102.local -c --build-arg main:NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug](#balena-push-0eb3102local--c---build-arg-mainnpm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug-1)
  - [balena push 0eb3102.local -c --env NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug](#balena-push-0eb3102local--c---env-npm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug)
  - [balena push 0eb3102.local -c --env NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug](#balena-push-0eb3102local--c---env-npm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug-1)
  - [balena push 0eb3102.local -c --env main:NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug](#balena-push-0eb3102local--c---env-mainnpm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug)
  - [balena push 0eb3102.local -c --env main:NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug](#balena-push-0eb3102local--c---env-mainnpm_token0acc7a49-830e-4254-bfe7-47dcfeb578b8---debug-1)
  - [echo on device](#echo-on-device)
  - [echo on device main container](#echo-on-device-main-container)

# Balena live-push can't find ENV
Balena live-push can't find the ENV variable in the build step.

|                    |                      |
| ------------------ | -------------------- |
| Device             | Intel NUC            |
| CLI version        | 12.9.5               |
| HOST OS VERSION    | balenaOS 2.50.1+rev1 |
| SUPERVISOR VERSION | 11.4.10              |

## balena push 0eb3102.local -c --build-arg NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[ ]` |
| without `main:` before envvar | `[x]` |
| with `""` around string       | `[x]` |
| without `""` around string    | `[ ]` |
| --build-arg                   | `[x]` |
| --env                         | `[ ]` |
```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --build-arg NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 267 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/10 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/10 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in dc4ce565e6e3
[Build]   [main] Removing intermediate container dc4ce565e6e3
[Build]   [main]  ---> aa430c78fb35
[Build]   [main] Step 3/10 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in defa7e898ec4
[Build]   [main] Removing intermediate container defa7e898ec4
[Build]   [main]  ---> 507264f03051
[Build]   [main] Step 4/10 : RUN echo "========================================================"
[Build]   [main]  ---> Running in fdc474dc3e11
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container fdc474dc3e11
[Build]   [main]  ---> c70dd930847c
[Build]   [main] Step 5/10 : RUN echo $NPM_TOKEN
[Build]   [main]  ---> Running in f89b09128b77
[Build]   [main] Removing intermediate container f89b09128b77
[Build]   [main]  ---> 38ec15dde255
[Build]   [main] Step 6/10 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in 59bf4aa2dd02
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 59bf4aa2dd02
[Build]   [main]  ---> 122d62262671
[Build]   [main] Step 7/10 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in 623989c8383f
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 623989c8383f
[Build]   [main]  ---> b301830e27b8
[Build]   [main] Step 8/10 : RUN echo "========================================================"
[Build]   [main]  ---> Running in baac7fe3cc28
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container baac7fe3cc28
[Build]   [main]  ---> 838f345ba4f5
[Build]   [main] Step 9/10 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in 2085db07cb14
[Build]   [main] Removing intermediate container 2085db07cb14
[Build]   [main]  ---> 7876a4c2cb77
[Build]   [main] Step 10/10 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in 43702932e82b
[Build]   [main] Removing intermediate container 43702932e82b
[Build]   [main]  ---> c2beb2ad5438
[Build]   [main] Successfully built c2beb2ad5438
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
^C

```
## balena push 0eb3102.local -c --build-arg NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug  
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[ ]` |
| without `main:` before envvar | `[x]` |
| with `""` around string       | `[ ]` |
| without `""` around string    | `[x]` |
| --build-arg                   | `[x]` |
| --env                         | `[ ]` |

```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --build-arg NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug  
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 276 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/10 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/10 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in 9f026c4af534
[Build]   [main] Removing intermediate container 9f026c4af534
[Build]   [main]  ---> 990341b54583
[Build]   [main] Step 3/10 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in 5c4ac80dca9b
[Build]   [main] Removing intermediate container 5c4ac80dca9b
[Build]   [main]  ---> 88e3a4afc989
[Build]   [main] Step 4/10 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 01e213f03a43
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 01e213f03a43
[Build]   [main]  ---> b27d59354dc2
[Build]   [main] Step 5/10 : RUN echo $NPM_TOKEN
[Build]   [main]  ---> Running in 5616abb6aba3
[Build]   [main] Removing intermediate container 5616abb6aba3
[Build]   [main]  ---> eb0b1881c28a
[Build]   [main] Step 6/10 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in f9d1d8c8c7cc
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container f9d1d8c8c7cc
[Build]   [main]  ---> b13733e3f22a
[Build]   [main] Step 7/10 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in 1ec198c2135f
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 1ec198c2135f
[Build]   [main]  ---> a5dbbf68a711
[Build]   [main] Step 8/10 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 57a344641718
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 57a344641718
[Build]   [main]  ---> 22e2390b0306
[Build]   [main] Step 9/10 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in 0f8865d30aa8
[Build]   [main] Removing intermediate container 0f8865d30aa8
[Build]   [main]  ---> cd97b84ac380
[Build]   [main] Step 10/10 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in ca91b8e704dd
[Build]   [main] Removing intermediate container ca91b8e704dd
[Build]   [main]  ---> 2bb826fdfe05
[Build]   [main] Successfully built 2bb826fdfe05
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Info]    Streaming device logs...
[Live]    Watching for file changes...
[Logs]    [7/29/2020, 12:51:43 PM] Killing service 'main sha256:c2beb2ad5438775f8491836e485b05b74bebbf7da603289f1154085b5a17f780'
[Logs]    [7/29/2020, 12:51:43 PM] Killed service 'main sha256:c2beb2ad5438775f8491836e485b05b74bebbf7da603289f1154085b5a17f780'
[Live]    Waiting for device state to settle...
^C

```
## balena push 0eb3102.local -c --build-arg main:NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[x]` |
| without `main:` before envvar | `[ ]` |
| with `""` around string       | `[ ]` |
| without `""` around string    | `[x]` |
| --build-arg                   | `[x]` |
| --env                         | `[ ]` |
```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --build-arg main:NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 285 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/9 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/9 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in e8c877261779
[Build]   [main] Removing intermediate container e8c877261779
[Build]   [main]  ---> ad7ee4d13698
[Build]   [main] Step 3/9 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in b8c1078aa2cc
[Build]   [main] Removing intermediate container b8c1078aa2cc
[Build]   [main]  ---> 0227d22064f0
[Build]   [main] Step 4/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 9ef6bab713dd
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 9ef6bab713dd
[Build]   [main]  ---> 79668f169cf8
[Build]   [main] Step 5/9 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in 6748a019d25c
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 6748a019d25c
[Build]   [main]  ---> e477f3a151dc
[Build]   [main] Step 6/9 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in 5e642ac82592
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 5e642ac82592
[Build]   [main]  ---> 34101991ac34
[Build]   [main] Step 7/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 2ae73917699d
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 2ae73917699d
[Build]   [main]  ---> 73f8116c8425
[Build]   [main] Step 8/9 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in 19c067f24260
[Build]   [main] Removing intermediate container 19c067f24260
[Build]   [main]  ---> 447979539524
[Build]   [main] Step 9/9 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in 4b89e7977a0b
[Build]   [main] Removing intermediate container 4b89e7977a0b
[Build]   [main]  ---> 2973a5c7cf09
[Build]   [main] Successfully built 2973a5c7cf09
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Info]    Streaming device logs...
[Live]    Watching for file changes...
[Logs]    [7/29/2020, 12:52:21 PM] Killing service 'main sha256:2bb826fdfe05f1881f7d31a4ac0689ac603b502983f4b3fd8a7d8e607b0c70f4'
[Logs]    [7/29/2020, 12:52:21 PM] Killed service 'main sha256:2bb826fdfe05f1881f7d31a4ac0689ac603b502983f4b3fd8a7d8e607b0c70f4'
[Live]    Waiting for device state to settle...
^C

```
## balena push 0eb3102.local -c --build-arg main:NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[x]` |
| without `main:` before envvar | `[ ]` |
| with `""` around string       | `[x]` |
| without `""` around string    | `[ ]` |
| --build-arg                   | `[x]` |
| --env                         | `[ ]` |
```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --build-arg main:NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 293 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/9 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/9 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in 06a75e7a5f37
[Build]   [main] Removing intermediate container 06a75e7a5f37
[Build]   [main]  ---> ae4de30faa26
[Build]   [main] Step 3/9 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in f46a33d69dd2
[Build]   [main] Removing intermediate container f46a33d69dd2
[Build]   [main]  ---> 7b591d145141
[Build]   [main] Step 4/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 3f245d29f38b
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 3f245d29f38b
[Build]   [main]  ---> 8db5d224ca6f
[Build]   [main] Step 5/9 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in 7d097a8f9e2b
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 7d097a8f9e2b
[Build]   [main]  ---> bd5a6eecc19b
[Build]   [main] Step 6/9 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in 161c9198f7e3
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 161c9198f7e3
[Build]   [main]  ---> 9a80ed267c4f
[Build]   [main] Step 7/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in a88e5f9321ad
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container a88e5f9321ad
[Build]   [main]  ---> 7286bd63dd21
[Build]   [main] Step 8/9 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in b4b643cef54e
[Build]   [main] Removing intermediate container b4b643cef54e
[Build]   [main]  ---> 343ca1eb6de0
[Build]   [main] Step 9/9 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in 0b595bb4867a
[Build]   [main] Removing intermediate container 0b595bb4867a
[Build]   [main]  ---> 40a22915ecae
[Build]   [main] Successfully built 40a22915ecae
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Info]    Streaming device logs...
[Live]    Watching for file changes...
[Logs]    [7/29/2020, 12:52:33 PM] Killing service 'main sha256:2973a5c7cf0904443c57cc0629eb5bdb887a56f1665c64e58dbe584c9ba54ee7'
[Logs]    [7/29/2020, 12:52:33 PM] Killed service 'main sha256:2973a5c7cf0904443c57cc0629eb5bdb887a56f1665c64e58dbe584c9ba54ee7'
[Live]    Waiting for device state to settle...
^C
```
## balena push 0eb3102.local -c --env NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug     
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[ ]` |
| without `main:` before envvar | `[ ]` |
| with `""` around string       | `[x]` |
| without `""` around string    | `[ ]` |
| --build-arg                   | `[ ]` |
| --env                         | `[x]` |
```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --env NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug     
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 301 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/9 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/9 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in 7bb380509ebb
[Build]   [main] Removing intermediate container 7bb380509ebb
[Build]   [main]  ---> 6c15aeab04a7
[Build]   [main] Step 3/9 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in cd51c6828f69
[Build]   [main] Removing intermediate container cd51c6828f69
[Build]   [main]  ---> 48b0c278c48f
[Build]   [main] Step 4/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in a1b8e1492609
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container a1b8e1492609
[Build]   [main]  ---> e7a95ab4f29c
[Build]   [main] Step 5/9 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in 95d65baa8625
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 95d65baa8625
[Build]   [main]  ---> e4a2372fcfaf
[Build]   [main] Step 6/9 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in a90ddc2357fa
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container a90ddc2357fa
[Build]   [main]  ---> e26442d3d1ba
[Build]   [main] Step 7/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in e8d4ce6477d8
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container e8d4ce6477d8
[Build]   [main]  ---> 5114575ffb00
[Build]   [main] Step 8/9 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in 2c0595c5f8d9
[Build]   [main] Removing intermediate container 2c0595c5f8d9
[Build]   [main]  ---> 0f62dd17edcf
[Build]   [main] Step 9/9 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in 956c6d6c0be7
[Build]   [main] Removing intermediate container 956c6d6c0be7
[Build]   [main]  ---> 38584a50e72e
[Build]   [main] Successfully built 38584a50e72e
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{"NPM_TOKEN":"0acc7a49-830e-4254-bfe7-47dcfeb578b8"},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Info]    Streaming device logs...
[Live]    Watching for file changes...
[Logs]    [7/29/2020, 1:01:39 PM] Killing service 'main sha256:40a22915ecae9ef8d135b0ae7daec406779a8e6ace3ac168d43184a4396bc1c3'
[Logs]    [7/29/2020, 1:01:39 PM] Killed service 'main sha256:40a22915ecae9ef8d135b0ae7daec406779a8e6ace3ac168d43184a4396bc1c3'
[Live]    Waiting for device state to settle...
[Debug]   Device state not settled, retrying in 1000ms
[Logs]    [7/29/2020, 1:01:39 PM] Installing service 'main sha256:38584a50e72e07b678f633ba56c9b84b7ff5b5f4d5959de5e0254db476638f85'
[Logs]    [7/29/2020, 1:01:39 PM] Installed service 'main sha256:38584a50e72e07b678f633ba56c9b84b7ff5b5f4d5959de5e0254db476638f85'
[Logs]    [7/29/2020, 1:01:39 PM] Starting service 'main sha256:38584a50e72e07b678f633ba56c9b84b7ff5b5f4d5959de5e0254db476638f85'
^C
```
## balena push 0eb3102.local -c --env NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug  
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[ ]` |
| without `main:` before envvar | `[x]` |
| with `""` around string       | `[ ]` |
| without `""` around string    | `[x]` |
| --build-arg                   | `[ ]` |
| --env                         | `[x]` |
```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --env NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug  
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 309 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/9 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/9 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in 473b3eeec89c
[Build]   [main] Removing intermediate container 473b3eeec89c
[Build]   [main]  ---> 1e39ce258f69
[Build]   [main] Step 3/9 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in 86d737d0ca3b
[Build]   [main] Removing intermediate container 86d737d0ca3b
[Build]   [main]  ---> db976d7065e3
[Build]   [main] Step 4/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 7cb68ab9f19f
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 7cb68ab9f19f
[Build]   [main]  ---> 7ab490914efa
[Build]   [main] Step 5/9 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in 542fa5a5fcae
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 542fa5a5fcae
[Build]   [main]  ---> 524a8acbd7ad
[Build]   [main] Step 6/9 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in a48212817f36
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container a48212817f36
[Build]   [main]  ---> f56d2fc33428
[Build]   [main] Step 7/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 07f2a178b618
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 07f2a178b618
[Build]   [main]  ---> 9e428873eadc
[Build]   [main] Step 8/9 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in cb782b05c142
[Build]   [main] Removing intermediate container cb782b05c142
[Build]   [main]  ---> c8b51cdc7fa2
[Build]   [main] Step 9/9 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in d4127bb9b819
[Build]   [main] Removing intermediate container d4127bb9b819
[Build]   [main]  ---> 4ab9e7003c01
[Build]   [main] Successfully built 4ab9e7003c01
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{"NPM_TOKEN":"0acc7a49-830e-4254-bfe7-47dcfeb578b8"},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Info]    Streaming device logs...

```
## balena push 0eb3102.local -c --env main:NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[x]` |
| without `main:` before envvar | `[ ]` |
| with `""` around string       | `[ ]` |
| without `""` around string    | `[x]` |
| --build-arg                   | `[ ]` |
| --env                         | `[x]` |
```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --env main:NPM_TOKEN=0acc7a49-830e-4254-bfe7-47dcfeb578b8 --debug
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 317 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/9 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/9 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in b5e69573ecb5
[Build]   [main] Removing intermediate container b5e69573ecb5
[Build]   [main]  ---> 8bc5ecc3f88e
[Build]   [main] Step 3/9 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in ca1701ed4ffc
[Build]   [main] Removing intermediate container ca1701ed4ffc
[Build]   [main]  ---> 4078c5cc91e0
[Build]   [main] Step 4/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 0e00280460e1
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 0e00280460e1
[Build]   [main]  ---> 2d3e81fb4461
[Build]   [main] Step 5/9 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in c39cfd70d936
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container c39cfd70d936
[Build]   [main]  ---> b90949da5047
[Build]   [main] Step 6/9 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in d3738ec7d28f
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container d3738ec7d28f
[Build]   [main]  ---> dc93c3182d41
[Build]   [main] Step 7/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 460be2808b56
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 460be2808b56
[Build]   [main]  ---> a87a8ae51199
[Build]   [main] Step 8/9 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in d80e470dfc83
[Build]   [main] Removing intermediate container d80e470dfc83
[Build]   [main]  ---> 6936f2408a6d
[Build]   [main] Step 9/9 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in 67606226fdd5
[Build]   [main] Removing intermediate container 67606226fdd5
[Build]   [main]  ---> 2a665997976d
[Build]   [main] Successfully built 2a665997976d
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{"NPM_TOKEN":"0acc7a49-830e-4254-bfe7-47dcfeb578b8"},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Info]    Streaming device logs...
[Live]    Watching for file changes...
[Logs]    [7/29/2020, 1:02:04 PM] Killing service 'main sha256:4ab9e7003c01e4b8113f6bd1307512984dc2fc9d6280462719b635b3371e0535'
[Logs]    [7/29/2020, 1:02:04 PM] Killed service 'main sha256:4ab9e7003c01e4b8113f6bd1307512984dc2fc9d6280462719b635b3371e0535'
[Live]    Waiting for device state to settle...
[Logs]    [7/29/2020, 1:02:04 PM] Installing service 'main sha256:2a665997976dcafb3042f9f6c953b251fed408ee3674aae55ac8f47c0d976028'
^C
```
## balena push 0eb3102.local -c --env main:NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug
|                               |       |
| ----------------------------- | ----- |
| with `main:` before envvar    | `[x]` |
| without `main:` before envvar | `[ ]` |
| with `""` around string       | `[x]` |
| without `""` around string    | `[ ]` |
| --build-arg                   | `[ ]` |
| --env                         | `[x]` |

```bash
~/Code/live_push_env 
❯ balena push 0eb3102.local -c --env main:NPM_TOKEN="0acc7a49-830e-4254-bfe7-47dcfeb578b8" --debug
[debug] Using . as build source
[Debug]   Checking we can access device
[Debug]   Sending request to http://192.168.2.87:48484/ping
[Debug]   Checking device version: 11.4.10
[Info]    Starting build on device 192.168.2.87
[Debug]   Loading project...
[Debug]   Resolving project...
[Info]    No "docker-compose.yml" file found at "."
[Info]    Creating default composition with source: "."
[Debug]   Creating project...
[Debug]   Tarring all non-ignored files...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Debug]   Found build tasks:
[Debug]       main: build [.]
[Debug]   Resolving services with [intel-nuc|amd64]
[Debug]   Found project types:
[Debug]       main: Standard Dockerfile
[Debug]   Probing remote daemon for cache images
[Debug]   Using 325 on-device images for cache...
[Debug]   Starting builds...
[Build]   [main] Step 1/9 : FROM balena/open-balena-base:v9.4.1 as base
[Build]   [main]  ---> 9a3f3e85167e
[Build]   [main] Step 2/9 : ARG NPM_TOKEN
[Build]   [main]  ---> Running in 1ad5cc014406
[Build]   [main] Removing intermediate container 1ad5cc014406
[Build]   [main]  ---> b957e92db16c
[Build]   [main] Step 3/9 : ENV NPM_TOKEN_ENV=$NPM_TOKEN
[Build]   [main]  ---> Running in b16e4c4de5f9
[Build]   [main] Removing intermediate container b16e4c4de5f9
[Build]   [main]  ---> 8ea606985eac
[Build]   [main] Step 4/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 9ecf51fe9253
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 9ecf51fe9253
[Build]   [main]  ---> eb1f19f68e0b
[Build]   [main] Step 5/9 : RUN echo "ARG look at that >>>>>${NPM_TOKEN}<<<<<"
[Build]   [main]  ---> Running in 907e4a7b2774
[Build]   [main] ARG look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 907e4a7b2774
[Build]   [main]  ---> f6606314c9d8
[Build]   [main] Step 6/9 : RUN echo "ENV look at that >>>>>${NPM_TOKEN_ENV}<<<<<"
[Build]   [main]  ---> Running in 0d873cb524a4
[Build]   [main] ENV look at that >>>>><<<<<
[Build]   [main] Removing intermediate container 0d873cb524a4
[Build]   [main]  ---> 93815ec8f222
[Build]   [main] Step 7/9 : RUN echo "========================================================"
[Build]   [main]  ---> Running in 9340b2249b7d
[Build]   [main] ========================================================
[Build]   [main] Removing intermediate container 9340b2249b7d
[Build]   [main]  ---> dc89452cc24c
[Build]   [main] Step 8/9 : LABEL io.resin.local.image=1
[Build]   [main]  ---> Running in ed186288632a
[Build]   [main] Removing intermediate container ed186288632a
[Build]   [main]  ---> 2b3d8f057619
[Build]   [main] Step 9/9 : LABEL io.resin.local.service=main
[Build]   [main]  ---> Running in 044cd4af5d38
[Build]   [main] Removing intermediate container 044cd4af5d38
[Build]   [main]  ---> cfa20e8c02b8
[Build]   [main] Successfully built cfa20e8c02b8
[Build]   [main] Successfully tagged local_image_main:latest
[Debug]   Setting device state...
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state
[Debug]   Sending target state: {"local":{"name":"hidden-sea","config":{"SUPERVISOR_DELTA_VERSION":"3","SUPERVISOR_DELTA":"1","SUPERVISOR_LOCAL_MODE":"1","SUPERVISOR_POLL_INTERVAL":"900000","SUPERVISOR_VPN_CONTROL":"true","SUPERVISOR_INSTANT_UPDATE_TRIGGER":"true","SUPERVISOR_CONNECTIVITY_CHECK":"true","SUPERVISOR_LOG_CONTROL":"true","SUPERVISOR_DELTA_REQUEST_TIMEOUT":"30000","SUPERVISOR_DELTA_APPLY_TIMEOUT":"0","SUPERVISOR_DELTA_RETRY_COUNT":"30","SUPERVISOR_DELTA_RETRY_INTERVAL":"10000","SUPERVISOR_OVERRIDE_LOCK":"false","SUPERVISOR_PERSISTENT_LOGGING":"false"},"apps":{"1":{"name":"localapp","commit":"localrelease","releaseId":"1","services":{"1":{"environment":{"NPM_TOKEN":"0acc7a49-830e-4254-bfe7-47dcfeb578b8"},"labels":{"io.resin.features.kernel-modules":"1","io.resin.features.firmware":"1","io.resin.features.dbus":"1","io.resin.features.supervisor-api":"1","io.resin.features.resin-api":"1"},"privileged":true,"tty":true,"restart":"always","network_mode":"host","volumes":["resin-data:/data"],"imageId":1,"serviceName":"main","serviceId":1,"image":"local_image_main:latest","running":true}},"volumes":{"resin-data":{}},"networks":{}}}},"dependent":{"config":{}}}
[Debug]   Sending request to http://192.168.2.87:48484/v2/local/target-state

[Debug]   Sending request to http://192.168.2.87:48484/v2/local/device-info
[Info]    Streaming device logs...
[Live]    Watching for file changes...
[Logs]    [7/29/2020, 1:02:16 PM] Killing service 'main sha256:2a665997976dcafb3042f9f6c953b251fed408ee3674aae55ac8f47c0d976028'
[Logs]    [7/29/2020, 1:02:16 PM] Killed service 'main sha256:2a665997976dcafb3042f9f6c953b251fed408ee3674aae55ac8f47c0d976028'
[Live]    Waiting for device state to settle...
^C
```

## echo on device
```
root@0eb3102:~# echo $NPM_TOKEN

root@0eb3102:~# 
```
## echo on device main container
```
❯ balena ssh 0eb3102.local main
root@0eb3102:/usr/src/app# echo $NPM_TOKEN
0acc7a49-830e-4254-bfe7-47dcfeb578b8
root@0eb3102:/usr/src/app#
```