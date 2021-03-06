**Project Update** 
I originally proposed to create a wave sculpture using mesh cloth as the wave and an ultrasonic sensor to control the servo motors which would move the waves. After some testing, I found that the servos alone did not rotate or pull enough to create enough velocity to initiate a wave. As a result I have changed the cloth wave into a kinetic sculpture made of paper. As the servo moves, the sculpture expands and contracts. 

***Process***
- In addition to having problems with the servo's force controllability, I found that the cloth I used was also too stiff to react to a wave. I tried replacing the cloth with napkins but found that they easily ripped once tugged by the strings connected to the servos. In the end I chose to abandon the cloth wave and opted for a kinetic paper sculpture with creases mimicing a wave form. I hope to revisit the cloth idea if I can find a thinner and workable cloth to test. Otherwise I may experiment with more paper folding patterns.
- I accidentally bought a continuous servo rather than the 180 servos provided in the kit. I learned that rather than being controlled by degrees, the continuos servos would turn continuously with the input write values controlling its speed. This was a problem for my project since I'd need the servo to reposition itself back after an action. (In the wave's case, rotating back and forth to make the cloth go up and down to ignite a wave). With research I found this was either impossible or quite complicated to do so I went back to using the 180 servo to pull on a string connected to a rubber band. The rubber band would guide the paper sculpture to stretch or contract accordingly. 
-  The ultrasonic sensor worked well until it suddenly started detecting random small values at sudden spurses of time. This was a very last minute issue and will be something I need to work on before the final showcase. I am suspecting that it is a problem with the sensor itself as I've tried rewiring, re-pinning, and moving it onto different spots of the breadboard. The code seems to be ok too. If I am unable to replace the sensor I will try to test out the code introduced in class where the averaged values of the sensor are used rather than the current direct values. 
- While trying to figure out what went wrong with the sensor, I mistakenly left the servo running as it continued to tug on the string. One of the strings eventually snapped so note taken: do not use threads, try to use stronger strings. Unfortunately that was the only string like material I had around me, I will try to see if I can buy floss in time to replace the strings. If not I will attempt to tripple thread each corner. 

***Project Photo***
![](wave.png)

***Project Video***

![kinetic sculpture](IMG_6201.MOV)

