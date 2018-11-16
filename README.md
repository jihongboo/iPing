# iPing
ICMP Ping in swift

一个使用Ping来检测当前设备网络状况的工具库，除了可以以简短的代码来检测网络延迟外，还可以通过内置的工具方便的获得设备当前的IP地址和网关地址。

~~~ swift
// GatewayIPAddress
let host1 = IPTool.getGatewayIPAddress()
// DeviceIPAddress
let host2 = IPTool.getDeviceIPAddress()
// start ping host
let host3 = "www.google.com"
let ping = Ping(host: host3).ping(count: 5) {(delay, timeout) in
            print("delay: \(delay)ms, timeout: \(Int(timeout * 100))%")
        }
 // you can stop pinging anytime
 ping.stop()
~~~
