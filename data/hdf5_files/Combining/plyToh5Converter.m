clc
clear

ptCloud = pcread('Piers1.ply');
ptCloud2 = pcread('AbutmentLH1.ply');
ptCloud3 = pcread('AbutmentRH1.ply');
ptCloud4 = pcread('Platform1.ply');

A(:,:,1) = [ ptCloud.Location(:,1) ptCloud2.Location(:,1) ptCloud3.Location(:,1) ptCloud4.Location(:,1) ];
A(:,:,2) = [ ptCloud.Location(:,2) ptCloud2.Location(:,2) ptCloud3.Location(:,2) ptCloud4.Location(:,2) ];
A(:,:,3) = [ ptCloud.Location(:,3) ptCloud2.Location(:,3) ptCloud3.Location(:,3) ptCloud4.Location(:,3) ];

A_trans=permute(conj(A),[3,1,2]);

h5create('Bridge1.h5','/data',[3 length(ptCloud.Location(:,1)) 4]);
h5write('Bridge1.h5', '/data', A_trans);

label=uint8(zeros(1,length(ptCloud.Location(:,1))));

h5create('Bridge1.h5','/label',[1 4],'Datatype','uint8');
h5write('Bridge1.h5','/label', [0 1 1 2]);



