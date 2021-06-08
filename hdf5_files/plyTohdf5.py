# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import h5py
from plyfile import PlyData, PlyElement
import numpy as np

#filenames = [line.rstrip() for line in open("filelist", 'r')]

f = h5py.File("data_training4.h5", 'w')
#f = h5py.File("./hdf5_files/data_testing.h5", 'w')

data = np.zeros(( 148, 2048, 3))

#for i in range(0, len(filenames)):
plydata = PlyData.read("Abutment1.ply")
for i in range(0, plydata.elements[0].count):
    data[i] = [plydata['vertex']['x'][i], plydata['vertex']['y'][i], plydata['vertex']['z'][i]]


f.create_dataset('abutment', data = data)
