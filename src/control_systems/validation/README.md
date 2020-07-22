## Validation and Verification

Validation and Verification of designed logic control systems are performed using the NuSMV symbolic model verification framework.

------------------------------------------------------------
### Computation Temporal Logic (CTL) Model Checking
The controller logic is specified in NuSMV language and its specifications are specified in CTL formulas. To perform verification for a single controller run on linux:
```bash
./NuSMV/bin/NuSMV smv_file.smv
```

Windows:
```batch
NuSMV\bin\NuSMV.exe  smv_file.smv
```

------------------------------------------------------------------------------------
#### References
1- [NuSMV](http://nusmv.fbk.eu)
