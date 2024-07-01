### Development and Analysis of Navigation Algorithms for Vacuum Cleaner Robots in MATLAB

**Abstract:** This project explores the implementation and analysis of two navigation strategies for a vacuum cleaner robot using MATLAB. The first strategy employs a systematic vertical movement, while the second adopts a random movement. Both approaches are compared in terms of area coverage efficiency, energy consumption, and overall performance. The results highlight the advantages and challenges of each method, providing a foundation for future improvements in the navigation systems of vacuum cleaner robots.

**Keywords:** Vacuum cleaner robot, systematic vertical movement, random movement, MATLAB.

#### Introduction
Vacuum cleaner robots have gained prominence for their autonomy and efficiency in floor cleaning. They use a combination of sensors, navigation algorithms, and artificial intelligence to map and effectively clean various areas, from small rooms to larger spaces with multiple rooms.

#### Methodology

1. **Objectives and System Requirements**
   - Develop a MATLAB code to simulate the behavior of a vacuum cleaner robot in a controlled environment with two distinct modes of operation: systematic vertical movement with obstacle avoidance and random movement with obstacle or wall rebound.

2. **Software Selection**
   - MATLAB was chosen for its ease of use in performing mathematical and visual simulations.

3. **Algorithm Development**
   - The algorithm development was carried out in two main stages, each corresponding to a functionality of the vacuum cleaner robot. In the first stage, the robot moves vertically, avoiding obstacles upon detection. In the second stage, the robot moves randomly, rebounding upon encountering obstacles or walls.

#### Literature Review

1. **Systematic Movement**
   - Refers to predefined cleaning patterns, such as vertical or horizontal movements, ensuring complete area coverage.
   
![image](https://github.com/eduardoluizbogo/Robot-vacuum-cleaner-simulation-project/assets/53580431/65acb9e6-d207-4b7c-a4fa-28fbd8aa8d0b)

2. **Random Movement**
   - Involves the robot moving in random directions within the environment, changing direction randomly upon encountering obstacles or walls.
   
![image](https://github.com/eduardoluizbogo/Robot-vacuum-cleaner-simulation-project/assets/53580431/35c8f43b-6166-42fe-a951-600792594c78)

3. **Obstacle Detection and Avoidance**
   - Utilizing methods like the Vector Field Histogram (VFH), which uses infrared, ultrasonic, and contact sensors to detect obstacles and adjust the robot's trajectory to avoid collisions.

#### Implemented Code

- The code simulates the vacuum cleaner robot using the bug 2 algorithm, with obstacle avoidance and trajectory adjustments when encountering room boundaries.

#### Results

1. **Systematic Vertical Method**
   - In the vertical simulation, the robot took 90 seconds to cover the entire room, corresponding to a speed of 2.22m/s in the simulation. This is approximately 11 times faster than real-life robots, achieving 100% coverage.

2. **Random Method**
   - Various experiments showed that random movement was less effective, with significant areas left uncleaned and multiple passes over the same area. The effectiveness varied between 20% and 30% in different tests.

#### Advantages and Disadvantages

1. **Systematic Vertical Movement**
   - **Advantages:** Ensures complete and orderly area coverage, maximizing efficiency.
   - **Disadvantages:** May be less effective in environments with many obstacles or irregular shapes.

2. **Random Movement**
   - **Disadvantages:** Does not guarantee complete and uniform area coverage, potentially leaving some parts uncleaned.

### References

1. Sebastian Thrun, Wolfram Burgard, and Dieter Fox. *Probabilistic Robotics*. MIT Press, 2005.
2. Wolfgang Hess, Damon Kohler, Holger Rapp, and Daniel Andor. *Real-time loop closure in 2D LIDAR SLAM*. IEEE International Conference on Robotics and Automation (ICRA), 2016.
3. Judea Pearl. *Heuristics: Intelligent Search Strategies for Computer Problem Solving*. Addison-Wesley, 1984.
4. Johann Borenstein and Yoram Koren. *The Vector Field Histogram—Fast Obstacle Avoidance for Mobile Robots*. IEEE Transactions on Robotics and Automation, 1989.
