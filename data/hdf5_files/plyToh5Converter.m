clc
clear

ptCloud = pcread('Abutment4.ply');

A(:,:,1) = ptCloud.Location(:,1);
A(:,:,2) = ptCloud.Location(:,2);
A(:,:,3) = ptCloud.Location(:,3);

A_trans=permute(conj(A),[3,2,1]);

h5create('Abutment4.h5','/data',[3 1 length(ptCloud.Location(:,1))]);
h5write('Abutment4.h5', '/data', A_trans);

label=uint8(zeroes(1,length(ptCloud.Location(:,1))));

h5create('Abutment4.h5','/label',length(ptCloud.Location(:,1)),'Datatype','uint8');
h5write('Abutment4.h5','/label', label);



