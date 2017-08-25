** To generate feature for each 3D model

1. Run 3DAlignment_v1.8.exe in windows 2000/XP
	(1) "gult32.dll" will be used.
	(2) The 3D model should be in Wavefront file format (.obj).
	(3) This will read "list.txt" to get each model. Note that, in "list.txt", each line is a filename (can include path, but cannot include ".obj") and the last line should be emply.
	(4) The following file will be used when calculating the feature: 12_0.OBJ, 12_1.OBJ, ..., 12_9.OBJ, glut32.dll, list.txt and 3D models
	
2. press 'n' to start
	(1) please note that the OpenGL window should not be overlap by other window in Windows 2000/XP. This is because the rendered image will be capture from video buffer.
	(2) Each model will create 5 feature file. filename_q4_v1.8.art, filename_q8_v1.8.art, filename_q8_v1.8.fd, filename_q8_v1.8.cir and filename_q8_v1.8.ecc in the same folder of each 3D model. The file "all_..." contains features of all 3D mdoels into a single file.


** To compare descriptors between two 3D models

1. Run GroundTruth_v1.85.exe in windows 2000/XP
	(1) Usage: "GroundTruth_v1.85.exe ModelName1 ModelName2"
	(2) Four files should be prepared for a model "ModelName": ModelName_q8_v1.8.art, ModelName_q8_v1.8.fd, ModelName_q8_v1.8.cir and ModelName_q8_v1.8.ecc
	(3) "align10.txt" and "q8_table" will be used.
	(4) The result will return an integer, which means the difference between the two 3D models. That is, small value means two models are similar.
