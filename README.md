# config
Ansible Configuration Management for router network of Freifunk Düsseldorf private AS

## Ddorf backbone structure
```
+--------------------------+
|    Rheinland Backbone    |
+----+----------------+----+
     |                |
+----+---+        +---+----+
| Edge01 |        | Edge02 |
+--+-+---+        +-+---+--+
   | |              |   |
   | +----------------+ |
   |                | | |
   | +--------------+ | |
   | |                | |
+--+-+---+        +---+-+--+
| Core01 |        | Core02 |
+--+-----+        +---+----+
   |                  |
   | +----------------+
   | |
+--+-+----+
| Site001 |  ...
+---------+
```

## Tunnel address calculation
The calculation is based on sequence numbers which are staticly assigned as host variables in the inventory.
To calculate the tunnel addresses we assign subnets of the IPv4 prefix in three hierarchy levels:
- one /19 for each core router
- one /20 for each direction (uplink or downlink from the perspective of the core router)
  - 0th subnet for tunnels between edge and core
  - 1st subnet for tunnels between core and site
- one /31 for each tunnel link
  - address 0 for upper tunnel partner
  - address 1 for lower tunnel partner

## Loopback address calculation
The calculation is based on sequence numbers which are staticly assigned as host variables in the inventory.
To calculate the loopback addresses for the routers we assign addresses from a special loopback subnet
- we use the 0th /21 subnet
- one /23 for each router area
  - 0th subnet for edge routers
  - 1st subnet for core routers
  - 2nd subnet for site routers
