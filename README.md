# Assembly-based Conceptual 3D Modeling

We developed a novel and intuitive assembly based 3D modeling interface to support conceptual design exploration activities. In the presented modeling interface, unlabeled segmented components of the objects are assembled to create new 3D models. we have devised an automated component suggestion algorithm based on a probabilistic factor graph. This algorithm helps the user to easily browse and select components from a database that are most compatible with the current state of 3D models being assembled. The component suggestion algorithm incorporates various aspects such as shape similarity, repetitions of shapes, and adjacency relationships.

For more details, please refer to the following publication:
> Jaiswal, P., Huang, J., & Rai, R. (2016). Assembly-based conceptual 3D modeling with unlabeled components using probabilistic factor graph. Computer-Aided Design, 74, 45-54.

This repository contains the codebase for component suggestion algorithm developed in MATLAB. If you use any part of this code for your work, please cite the above paper.

#### Usage Instructions:
1. (Offline task) Run the 'calcData.m' file, which extracts relevant information from the database (not included), and save it in 'Database.mat' file.

2. (Online task) Run 'getOutput.m' file which suggests plausible parts to be assembled based on the input part indices in 'inP'.

Note: Some portions of the code are downloaded from MATLAB Central File Exchance and Github repositories.

*****************************************************************
### Owner:
	MAD Lab
	Department of Mechanical and Aerospace Engineering
	University at Buffalo, Buffalo, NY - 14260
	http://madlab.eng.buffalo.edu/
*****************************************************************