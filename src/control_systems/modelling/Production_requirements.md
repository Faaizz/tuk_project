## Production Requirements

- Leave MCB & MCBR running always (MCB=1 and MCBR=1)
- Set MCB to produce lids (MCB_PRODUCE_LIDS=0)
- Set MCBR to produce lids (MCBR_PRODUCE_LIDS=1)
- Do not divert raw material (PUWS_AL1_B1_PLUS=1 & PUWS_AL1_B1_RIGHT=0)

- Internal variable MCB_CONTROL:
    - MCB_CONTROL=0 implies MCB is next
    - MCB_CONTROL=1 implies MCBR is next
    - Initialize to MCB_CONTROL=0

### MCB
- If MCB is next (MCB_CONTROL=0):
    - Deactivate Pivot Arm (PAS_AL1_TURN=0 & PAS_AL1_PLUS=0)
    - Emit raw material (E_AL1_B1=1)



### MCBR
- If MCBR is next (MCB_CONTROL=1):
    - Activate Pivot Arm (PAS_AL1_TURN=1 & PAS_AL1_PLUS=1)
    - Emit raw material (E_AL1_B1=1)

