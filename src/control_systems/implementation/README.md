## Implementation

Implementation of designed logic control systems are carried out as an interconnection of various parts.

------------------------------------------------------------
### Working Implementation

- Virtual factory as Modbus TCP Server
- Virtual factory as slave device in OpenPLC

------------------------------------------------------------

### Setting up ScadaBR with OpenPLC runtime via Modbus IP

**Note:** To get an IP that works from the ScadaBR virtual machine, it might be required to setup a local network.

- **Add Data Source**: Add a new data source of type *Modbus IP* with it's Host set to the IP address of the running OpenPLC runtime, make sure to "Start PLC" on the OpenPLC interface. A couple of settings that seemed to work well can be found in this detailed post by @astang on the OpenPLC community discussion board [3]. The gist of it is:  

    ```sh
    Update period: 1 second
    Timeout: 5000
    Retries: 200
    Transport type: "TCP with keep-alive"
    ```

- **Add Data Points**: Data points can be configured for the added data source. The I/O address mapping on OpenPLC runtime is mapped to the Modbus address space as shown in [4]. The mapping ends at %IX99.7 and %QX99.7 for digital input and output addresses respectively. Although, slave addresses start from position 100 (e.g. %IX100.0), the mapping is easily extensible.  
  
  | PLC Address         | Modbus Address    | ScadaBR Register      |
  | -----------------   | ---------------   | -----------------     |
  | %IX100.0            | 800               | Input status          |
  | %IX101.3            | 903               | Input status          |
  | %QX100.2            | 802               | Coil status           |
  | %QX101.0            | 900               | Coil status           |
