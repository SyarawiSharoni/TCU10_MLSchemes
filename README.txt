# TCU10_MLSchemes
Description: Wind Speed (U10) estimates inside tropical cyclone environment. The U10 machine learning models developed for Jason series altimeter. The code should be run in MATLAB.
Created by Syarawi Sharoni 4/11/2020

Output, [y1] = Jason U10 wind speed.
The input file must be in matrix form.

Input for Scheme 1 (S1), x1 = N x 2 matrix input parameters as listed below
Column 1 = Ku-band backscatter
Column 2 = Ku-band SWH

Input for Scheme 2 (S2), x1 = N x 2 matrix input parameters as listed below
Column 1 = C-band backscatter
Column 2 = C-band SWH

Input for Scheme 3 (S3), x1 = N x 4 matrix input parameters as listed below
Column 1 = Ku-band backscatter
Column 2 = Ku-band SWH
Column 3 = C-band backscatter
Column 4 = C-band SWH

Input for Scheme 4 (S4), x1 = N x 5 matrix input parameters as listed below
Column 1 = Ku-band backscatter
Column 2 = Ku-band SWH
Column 3 = Brightness Temperature 18.7 GHz
Column 4 = Brightness Temperature 23.8 GHz
Column 5 = Brightness Temperature 34.0 GHz

Input for Scheme 5 (S5), x1 = N x 4 matrix input parameters as listed below
Column 1 = Ku-band backscatter
Column 2 = Ku-band SWH
Column 3 = Liquid Water Content (LWC)
Column 4 = Water Vapor Content (WVC)

Input for Scheme 6 (S6), x1 = N x 9 matrix input parameters as listed below
Column 1 = Ku-band backscatter
Column 2 = Ku-band SWH
Column 3 = C-band backscatter
Column 4 = C-band SWH
Column 5 = Brightness Temperature 18.7 GHz
Column 6 = Brightness Temperature 23.8 GHz
Column 7 = Brightness Temperature 34.0 GHz
Column 8 = Liquid Water Content (LWC)
Column 9 = Water Vapor Content (WVC)

Example for Artificial Neural Network (ANN)
[y1] = TCU10_annS1_fx(x1);

Example for Support Vector Machine (SVM)
load TCU10_svmS1_fx
[y1] = TCU10_svmS2_fx.predictFcn(x1);

Example Gaussian Process Regression (GPR)
load TCU10_gprS1_fx
[y1] = TCU10_gprS1_fx.predictFcn(x1);

Detail paper discussed this model is "Tropical cyclone wind speed estimation from the satellite altimeter derived ocean parameters - Syarawi Sharoni,2021"
Please cite the above paper. TQ.