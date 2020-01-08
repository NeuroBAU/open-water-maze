# Open-Water-Maze
Digital reconstruction of a real Water Maze environment for comparing spatial navigation in biological and artificial agents

![Environment scanning using Rasperry PI + Arduino](graphics/environment_scanning.png)

![panoramic_tile_set](graphics/panoramic_tile_set.png)

The **"Open-Water Maze" (OWM)** is an open resource to promote the adoption of *in-silico* experiments in behavioral neuroscience. The OWM is a digital reconstruction of a real environment (i.e. a water maze) used to:

1. Assess **exploration vs exploitation strategies** used by biological agents (i.e. mice) navigating the water maze

2. **Compare biological and artificial agents** performing a similar spatial navigation task



The OWM is based on two strong assumptions:

1. Rodents use vision to solve the task

2. The rodents' field of view is constrained (i.e. mostly frontal and overhead) due to the head's position in the water

### Procedure

A robot (Arduino + Raspberry Pi 3 equipped with a PiNoIR camera) was placed on the floor of the empty water maze and it acquired 360 degrees pictures of the room at different positions. A grid (7 x 7 cells, side = 20 cm] was overlaid on the pool floor. The robot was placed sequentially on each cell (N = 45) covering the entire pool area (diameter: 140 cm). 

![grid placed on the floor of the watermaze](graphics/grid.png)

The eye of the camera was placed at 21.5 cm from the pool floor.

![robot](graphics/robot.png)


The camera acquired pictures at two different vertical angles (30° and 60°, relative to the horizon - the water surface @ 21.5 cm from the floor of the pool) to reproduce the (estimated) field of view of a rodent swimming in the water maze. A total of 16 images (separated by 22.5° interval) were acquired at each of the 45 cells (i.e. positions) covering the floor pool.


![image_from_single position](graphics/image_from_single position.png)


The pool is located in an evenly illuminated and visually homogeneous room (white walls, white ceiling, and a white curtain). Only four salient cues are placed at the corners of the room (distance form the pool center: ~170 cm). Additional cues include a rod on the ceiling that holds the camera used for behavior tracking and a white curtain.

Each image was visually inspected to code for the presence or absence of the following visual cues: 

vertical stripes, horizontal stripes, plus sign, coffee sign, rod, wall/ceiling border, curtain , and the corners of the room.

Images (N=720 x 2 vertical angles) are available in two different formats [1920 × 1080; 128 x 56; 8-bit]



## misc.

- the set of images labeled as A are taken at standard vertical angle (30 degrees relative to the horizon).
  the set of images labeled as B are taken at a vertical angle of 60 degrees relative to the horizon.
  The horizon is defined as the water surface

- small_median images have been first converted to 128 x 56 8-bit images then a median filter (size = 1px) has been applied



### Watermaze specifics

![image](graphics/water_maze_measures.jpg)



