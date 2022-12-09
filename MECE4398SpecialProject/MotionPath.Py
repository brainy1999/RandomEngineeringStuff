#Bernard Li
# Code to create motion path for crazyflie based on other reachable set
# 
# Limited Technologies LLC 
#Swarm Robotics Laboratory 
#Cescon Group Research Laboratory
# Version 1.1

import time

import cflib.crtp
from cflib.crazyflie import Crazyflie
from cflib.crazyflie.log import LogConfig
from cflib.crazyflie.syncCrazyflie import SyncCrazyflie
from cflib.crazyflie.syncLogger import SyncLogger
from cflib.utils import uri_helper

crazyflie = Crazyflie() #calls crazyflie library
cflib.crtp.init_drivers()

# crazyflie.connected.add_callback(crazyflie_connected) #gets the crazyflie to print text
crazyflie.open_link("radio://0/80/2M/E7E7E7E7E7") #connects crazyflie to pc
print("connected to crazyflie")

# sets values for TAER. Range is from 10001 to 60000, but 0 stops motors
driftroll = 1
driftyaw = 0

pitch = 1
roll = 1
yawrate = 0

# min pitch 0, max pitch 4. 
thrust = 55000
hoverthrust = 45000
landingthrust = hoverthrust - 10000
commandtime = 2
maxdelay = 0.4
instances = int(round(commandtime/maxdelay,0))
print(instances)

# orders crazyflie to fire motors
print("startup")
crazyflie.commander.send_setpoint(0,0,0,0)
time.sleep(0.4)
crazyflie.commander.send_setpoint(0,0,0,0)
time.sleep(0.4)
print("Hover Motors")
crazyflie.commander.send_setpoint(driftroll,0,driftyaw,hoverthrust)
time.sleep(maxdelay)
#crazyflie.commander.send_setpoint(roll,0,yawrate,hoverthrust)
#time.sleep(maxdelay)

print("executing command")
for t in range(0,instances):
    crazyflie.commander.send_setpoint(roll+driftroll, pitch, yawrate+driftyaw, thrust)
    time.sleep(maxdelay)

print("attempting landing")
for t in range(0,instances+1):
    crazyflie.commander.send_setpoint(driftroll, 0, driftyaw, landingthrust)
    landingthrust - 2000
    time.sleep(maxdelay)

crazyflie.commander.send_setpoint(0,0,0,0)
crazyflie.close_link() #closes crazyflie
print("test complete, crazyflie closed")
