# CS446 Project:Chinese Handwritting Characters recognition through TDNN models with Transfer learning and Image Processing 
This project uses a TDNN based transfer learning model to recognize Chinese handwriting characters. All the codes can be found under 'Code' folder:

**Data_Processing_Matlab:** 

Printed characters: stores all the printed character data: images of 15 fonts of 30 characters

codes for image pre-processing to get prominent character features:

   * *main.m*: get the training and testing data of the 30 randomly generated handwriting character from HCL2000 database. It generates 4 files:  
   
      1. *X_Train:* 30X500 training data for 500 different handwritings respect to each of the 30 characters.   
      2. *Y_Train:* 30X1 training labels.  
      3. *X_Test:* 30X200 test data, which are 200 different handwritings for the same 30 characters.
      4. *Y_Test:* 30X1 testing labels.
     
   * *main2.m:* get the pre-processed data for printed character images.
    
The generated data can be found at the data folder: Data_700_30.zip

Since the database is too large to upload, we did not upload the HCL2000 database. The dataset can be found at: http://www.datatang.com/data/13885


**TDNN_Python:**

codes for the two TDNN model:

  * *TDNN_1.py:* The first TDNN model to generate the initial weights and biases using the 30 printed characters. The weights and biases files generated can be found under Data/Data_Print folder.
   
  * *TDNN_2.py:* The second TDNN model that reads the parameters produced by the first model as the initial parameters and train the model using the *X_Train*,*Y_Train* gained. It then will test on the testing data and give the testing accuracy and confusion matrix. Results can be found at the 'Results' folder.
