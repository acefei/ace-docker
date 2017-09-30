### There are some errors on elasticsearch launching.
1. ERROR Could not register mbeans java.security.AccessControlException: access denied ("javax.management.MBeanTrustPermission" "register")       
   Add `-Dlog4j2.disable.jmx=true` into config/jvm.options

2. max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]         
   Run `sudo sysctl -w vm.max_map_count=262144` on your host, the kernal in docker container would read this value.

3. Exception in thread "main" java.lang.RuntimeException: don't run elasticsearch as root.        
   Add `-Des.insecure.allow.root=true` into config/jvm.options

