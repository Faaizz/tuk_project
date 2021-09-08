#============================================================
# DEMO CONTROLLER
# AUTHOR: Faizudeen Kajogbola, Ridwan Shobande
#============================================================

#============================================================
# Constants
MODBUS_HOST= "192.168.1.111"
MODBUS_PORT= 502
TAGS_PATH= "./tags.csv"
CYCLE_PERIOD= 100 #milliseconds

#============================================================
# Imports
import sys, time, threading
from importlib import util

# User-defined Imports
module_name="modbusclient"
file_path= "./src/modbusclient.py"
spec = util.spec_from_file_location(module_name, file_path)
modbusclient = util.module_from_spec(spec)
sys.modules[module_name] = modbusclient
spec.loader.exec_module(modbusclient)
from modbusclient import FactoryIOModbusClient

#============================================================
# FAULT INJECTION THREAD
class FaultInjector(threading.Thread):
    def __init__(self, fmc):
        threading.Thread.__init__(self)
        self.fmc= fmc

    def run(self):
        # FAULT INJECTION
        # ACTUATORS
        # Inject fault into AL1_ST_X_POS after 1 second
        time.sleep(5)
        self.fmc.write_fault("AL1_ST_X_SET", 700)
        # SENSORS
        # Inject fault into ST_AL1_ST1 after 1 + 2 seconds
        time.sleep(7)
        self.fmc.read_fault("ST_AL1_ST1", True)


#============================================================
# Create client instance
with FactoryIOModbusClient(MODBUS_HOST, MODBUS_PORT, filepath=TAGS_PATH) as client:
    # Connect client
    isConnected= client.connect()
    assert isConnected

    # Initialize FaultInjection thread
    fi_background= FaultInjector(client)
    # start thread in background
    fi_background.start()

    # Initialize Places
    # Places
    PA13= True
    PS0= True
    PSC= True
    PS1= False
    PS23= False
    PS2= False
    PS3= False
    PS4= False
    PS5= False
    PS6= False
    PS7= False
    PS8= False
    PS9= False
    PS10= False
    PS11= False
    PS12= False
    PSE1= False
    PSE2= False
    PSE0= True

    # Controller execution cycle
    while True:

        # Read inputs
        ST_AL1_ST1= client.read_tag("ST_AL1_ST1")
        ST_AL1_ST2= client.read_tag("ST_AL1_ST2")
        ST_AL1_ST3= client.read_tag("ST_AL1_ST3")
        RP_AL1_ST_CLAMPED= client.read_tag("RP_AL1_ST_CLAMPED")
        AL1_ST_DETECTED= client.read_tag("AL1_ST_DETECTED")
        AL1_ST_X_POS= client.read_tag("AL1_ST_X_POS")
        AL1_ST_Y_POS= client.read_tag("AL1_ST_Y_POS")
        AL1_ST_Z_POS= client.read_tag("AL1_ST_Z_POS")

        # Controller Logic
        
        # Transitions
        #TS1
        if PA13 and ST_AL1_ST1 and not PS1:
            print("TS1")
            PA13=False
            PS1=True
        
        #TS2
        if PS0 and PSC and PS1 and ST_AL1_ST2 and not PS23:
            print("TS2")
            PS0=False
            PSC=False
            PS1=False
            PS23=True
        
        #TS23
        if PS23 and not PS2:
            print("TS23")
            PS23=False
            PS2=True

        #TS3
        if PS2 and RP_AL1_ST_CLAMPED and not PS3:
            print("TS3")
            PS2=False
            PS3=True

        #TS4
        if PS3 and (AL1_ST_Y_POS>540) and (AL1_ST_Y_POS<580) and not PS4:
            print("TS4")
            PS3=False
            PS4=True

        #TS5
        if PS4 and (AL1_ST_Z_POS>780) and (AL1_ST_Z_POS<820) and not PSC and not PS5 and not PA13:
            print("TS5")
            PS4=False
            PSC=True
            PS5=True
            PA13=True

        #TS6
        if PS5 and AL1_ST_DETECTED and not PS6:
            print("TS6")
            PS5=False
            PS6=True

        #TS7
        if PS6 and (AL1_ST_Z_POS>390) and (AL1_ST_Z_POS<430) and not PS7:
            print("TS7")
            PS6=False
            PS7=True

        #TS8
        if PS7 and (AL1_ST_X_POS>750) and (AL1_ST_X_POS<790) and not PS8:
            print("TS8")
            PS7=False
            PS8=True

        #TS9
        if PS8 and PSE0 and (AL1_ST_Z_POS>580) and (AL1_ST_Z_POS<620) and not PS9:
            print("TS9")
            PS8=False
            PSE0=False
            PS9=True

        #TS10
        if PS9 and not AL1_ST_DETECTED and not PS0 and not PS10 and not PSE0:
            print("TS10")
            PS9=False
            PS0=True
            PS10=True
            PSE0=True

        #TS11
        if PS9 and not AL1_ST_DETECTED and not PS0 and not PS11 and not PSE0:
            print("TS11")
            PS9=False
            PS0=True
            PS11=True
            PSE0=True

        #TS12
        if PS9 and not AL1_ST_DETECTED and not PS0 and not PS12 and not PSE0:
            print("TS12")
            PS9=False
            PS0=True
            PS12=True
            PSE0=True

        #TS13
        if PS10 and PS11 and PS12 and PSE0 and not PSE1:
            print("TS13")
            PS10=False
            PS11=False
            PS12=False
            PSE0=False
            PSE1=True

        #TSE1
        if PSE1 and not ST_AL1_ST3 and not PSE2:
            print("TSE1")
            PSE1=False
            PSE2=True

        #TSE2
        if PSE2 and ST_AL1_ST3 and not PSE0:
            print("TSE2")
            PSE2=False
            PSE0=True

        # Outputs
        if PS0:
            client.write_tag("AL1_ST_X_SET", 0)
            client.write_tag("AL1_ST_Y_SET", 560)
            client.write_tag("AL1_ST_Z_SET", 410)
        if PSC:
            client.write_tag("RP_AL1_ST_CLAMP", False)
        if PS23:
            client.write_tag("RP_AL1_ST_CLAMP", False)
            client.write_tag("AL1_ST_GRAB", False)
        if PS2:
            client.write_tag("RP_AL1_ST_CLAMP", True)
            client.write_tag("AL1_ST_GRAB", False)
        if PS3:
            client.write_tag("RP_AL1_ST_CLAMP", True)
            client.write_tag("AL1_ST_GRAB", False)
            client.write_tag("AL1_ST_Y_SET", 560)
        if PS4:
            client.write_tag("RP_AL1_ST_CLAMP", True)
            client.write_tag("AL1_ST_GRAB", False)
            client.write_tag("AL1_ST_Z_SET", 800)
        if PS5:
            client.write_tag("AL1_ST_GRAB", True)
        if PS6:
            client.write_tag("AL1_ST_GRAB", True)
            client.write_tag("AL1_ST_Z_SET", 410)
        if PS7:
            client.write_tag("AL1_ST_GRAB", True)
            client.write_tag("AL1_ST_X_SET", 770)
        if PS8:
            client.write_tag("AL1_ST_GRAB", True)
            client.write_tag("AL1_ST_Z_SET", 600)
        if PS9:
            client.write_tag("AL1_ST_GRAB", False)
        if PSE1:
            client.write_tag("AL1_EMIT", True)
            client.write_tag("RC_AL1_ST", True)
        if PSE2:
            client.write_tag("RC_AL1_ST", True)
            client.write_tag("AL1_EMIT", False)
        if PSE0:
            client.write_tag("AL1_EMIT", False)
            client.write_tag("RC_AL1_ST", False)      

        time.sleep(CYCLE_PERIOD/1000)
