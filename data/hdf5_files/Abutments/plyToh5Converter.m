clc
clear

ptCloud = pcread('Abutment5.ply');
ptCloud2 = pcread('Abutment5.ply');
ptCloud2 = pcread('Abutment5.ply');

A(:,:,1) = [ ptCloud.Location(:,1) ptCloud2.Location(:,1) ptCloud2.Location(:,1)];
A(:,:,2) = [ ptCloud.Location(:,2) ptCloud2.Location(:,2) ptCloud2.Location(:,1)];
A(:,:,3) = [ ptCloud.Location(:,3) ptCloud2.Location(:,3) ptCloud2.Location(:,1)];

A_trans=permute(conj(A),[3,1,2]);

h5create('Abutment6.h5','/data',[3 length(ptCloud.Location(:,1)) 2]);
h5write('Abutment6.h5', '/data', A_trans);

label=uint8(zeros(1,length(ptCloud.Location(:,1))));

h5create('Abutment6.h5','/label',[1 2],'Datatype','uint8');
h5write('Abutment6.h5','/label', [0 0]);



