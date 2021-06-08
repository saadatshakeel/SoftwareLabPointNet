# -*- coding: utf-8 -*-
"""
Created on Thu May 20 23:39:29 2021

@author: kca
"""

import h5py
#ply_data_train1.h5

file_name = 'ply_data_train1.h5'
f = h5py.File(file_name, 'r+')     # open the file

# List all groups
print('All groups')
for key in f.keys():  # Names of the groups in HDF5 file.
    print(key)
print()

# Get the HDF5 group
group = f['Calculation']

# Checkout what keys are inside that group.
print('Single group')
for key in group.keys():
    print(key)
print()
#if you want to modify other quantity, check de list and change the subgroup below
# Get the HDF5 subgroup
subgroup = group['conductivity_dc']

# Checkout what keys are inside that subgroup.
print('Subgroup')
for key in subgroup.keys():
    print(key)
print()

new_value = 70
data = subgroup['Temperature']  # load the data
data[...] = new_value  # assign new values to data
f.close()  # close the file

# To confirm the changes were properly made and saved:

f1 = h5py.File(file_name, 'r')
print(np.allclose(f1['Calculation/conductivity_dc/Temperature'].value, new_value))