import h5py
import scipy.io as sio


def load_matlab_data(fullfilename, pc_variable_name, label_variable_name):
    matlab_mat = sio.loadmat(fullfilename)
    pc = matlab_mat[pc_variable_name]
    label = matlab_mat[label_variable_name]
    return pc, label

def save_h5(filename, pc, label, partial_path):
    path = partial_path + filename + '.hdf5'
    with h5py.File(filename, 'w') as f:
        f.create_dataset("data", data=pc)
        f.create_dataset("label", data=label)
        print(f'file {filename}.hdf5 was created in project directory, in {partial_path}')
        return
    

a = load_matlab_data('matlab1', 'pointdata', 'label')
save_h5('abutmentdata5.h5',a[0], a[1],'/data')
