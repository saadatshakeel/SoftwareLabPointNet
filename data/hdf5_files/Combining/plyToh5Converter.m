clc
clear

ptCloud = pcread('Piers5_.ply');
% ptCloud2 = pcread('AbutmentLH1.ply');
ptCloud3 = pcread('AbutmentRH5.ply');
ptCloud4 = pcread('Platform5.ply');

A(:,:,1) = [ ptCloud.Location(:,1) ptCloud3.Location(:,1) ptCloud4.Location(:,1) ];
A(:,:,2) = [ ptCloud.Location(:,2) ptCloud3.Location(:,2) ptCloud4.Location(:,2) ];
A(:,:,3) = [ ptCloud.Location(:,3) ptCloud3.Location(:,3) ptCloud4.Location(:,3) ];

A_trans=permute(conj(A),[3,1,2]);

h5create('Bridge5.h5','/data',[3 length(ptCloud.Location(:,1)) 3]);
h5write('Bridge5.h5', '/data', A_trans);

label=uint8(zeros(1,length(ptCloud.Location(:,1))));

h5create('Bridge5.h5','/label',[1 3],'Datatype','uint8');
h5write('Bridge5.h5','/label', [0 1 2]);



