% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

% % model = 'VMICC';
% % load( '../VoxelMorph/VMCVPR18Results_2022/VoxelMorph_cvpr2018_vm1_cc.h5_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'VMISSD';
% % load( '../VoxelMorph/VMCVPR18Results_2022/VoxelMorph_cvpr2018_vm1_l2.h5_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'VMIICC';
% % load( '../VoxelMorph/VMCVPR18Results_2022/VoxelMorph_cvpr2018_vm2_cc.h5_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'VMIISSD';
% % load( '../VoxelMorph/VMCVPR18Results_2022/VoxelMorph_cvpr2018_vm2_l2.h5_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'VMDiff';
% % load( '../VoxelMorph/VMMICCAI18Results_2022/VoxelMorph_MICCAI_2018_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% model = 'VoxelMorph_GIT_2021';
% load( '../../VoxelMorph/VoxelMorph_mhg2023/VoxelMorph_GIT_NIREPS/VoxelMorph_GIT_2021_NIREPS_fixed02_moving01.mat' );
% 
% write_grid( warp, warped, model, false );

model = 'VoxelMorph_GIT_2021';

datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\warp_SyMNet.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\warped_SyMNet.mat' );

warp = datos1.warp_SyMNet;
warped = datos2.warped_SyMNet;

write_grid(warp, warped, model, false);

% % 
% % model = 'SynthNetShapes';
% % load( '../SynthMorph/SynthMorph_mhg2023/NIREPS/SynthMorph_Shapes_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'SynthNetBrains';
% % load( '../SynthMorph/SynthMorph_mhg2023/NIREPS/SynthMorph_Brains_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'SyMNetDisp';
% % load( '../SyMNet/SyMNet_mhg2022/NIREPS/SyMNet_fea8_140000_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'SyMNetDiff';
% % load( '../SyMNet/SyMNet_mhg2022/NIREPS/SyMNet_smo30_update_80000_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, false );
% % 
% % model = 'LapIRNDisp';
% % load( '../LapIRN/LapIRN_mhg2022/NIREPS/LapIRNDisp_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, true );
% % 
% % model = 'LapIRNDiff';
% % load( '../LapIRN/LapIRN_mhg2022/NIREPS/LapIRNDiffeo_NIREPS_fixed02_moving01.mat' );
% % 
% % write_grid( warp, warped, model, true );
% % 
% model = 'TransMorph_OASIS';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/TransMorph_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'TransMorphLarge_OASIS';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/TransMorphLarge_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'TransMorphIXI';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/TransMorphIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'TransMorphDiff';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/TransMorphDiffIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, true );
% 
% model = 'TransMorphBspl';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/TransMorphBSplIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'TransMorphBayes';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/TransMorphBayesIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'CycleMorph';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/CycleMorphIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'PVT';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/PVTIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'nnFormer';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/nnFormerIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'VIT';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/ViTVNetIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );

% model = 'MIDIR';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/MIDIRIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'CoTr';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/CoTrIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'VXM1IXI';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/VoxelMorph1IXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );
% 
% model = 'VXM2IXI';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/VoxelMorph2IXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, false );

% model = 'VXMDiffIXI';
% load( '../../TransMorph/TransMorph_mhg2023/NIREPS/VoxelMorphDiffIXI_NIREPS_fixed02_moving01.mat' );
% warp = permute(warp, [1,3,4,5, 2]);
% 
% write_grid( warp, warped, model, true );

% model = 'NODEO';
% load( '../NODEO/NODEO_mhg2023/result_NIREP16S_Default/NODEO_NIREPS_fixed_02_moving_01_df.mat' );
% write_grid( warp, warp(:,:,:,1), model, false );

% model = 'MermaidBueno_svf_map_ncc';
% load( '../../Mermaid/mermaid_2023/Mermaid_mhg2023/NIREPS/Mermaid_Buenos/Mermaid_svf_map_ncc_NIREPS_fixed02_moving01.mat' );
% warp = diffeo;
% warp = permute(warp, [1,3,4,5,2]);
% 
% warp = squeeze(warp);
% 
% x = linspace(0, 1, 176);
% y = linspace(0, 1, 208);
% z = linspace(0, 1, 176)
% 
% [X, Y, Z] = meshgrid( y, x, z);
% 
% aux = warp;
% 
% warp(:,:,:,1) = X - aux(:,:,:,2); 
% warp(:,:,:,2) = Y - aux(:,:,:,1); 
% warp(:,:,:,3) = Z - aux(:,:,:,3); 
% 
% write_grid( warp, warp(:,:,:,1), model, true );

% model = 'MermaidBueno_svf_scalar_momentum_map_ncc';
% load( '../../Mermaid/mermaid_2023/Mermaid_mhg2023/NIREPS/Mermaid_Buenos/Mermaid_svf_scalar_momentum_map_ncc_NIREPS_fixed02_moving01.mat' );
% warp = diffeo;
% warp = permute(warp, [1,3,4,5,2]);
% 
% warp = squeeze(warp);
% 
% x = linspace(0, 1, 176);
% y = linspace(0, 1, 208);
% z = linspace(0, 1, 176)
% 
% [X, Y, Z] = meshgrid( y, x, z);
% 
% aux = warp;
% 
% warp(:,:,:,1) = X - aux(:,:,:,2); 
% warp(:,:,:,2) = Y - aux(:,:,:,1); 
% warp(:,:,:,3) = Z - aux(:,:,:,3); 
% 
% write_grid( warp, warp(:,:,:,1), model, true );

% model = 'MermaidBueno_svf_vector_momentum_map_ncc';
% load( '../../Mermaid/mermaid_2023/Mermaid_mhg2023/NIREPS/Mermaid_Buenos/Mermaid_svf_vector_momentum_map_ncc_NIREPS_fixed02_moving01.mat' );
% warp = diffeo;
% warp = permute(warp, [1,3,4,5,2]);
% 
% warp = squeeze(warp);
% 
% x = linspace(0, 1, 176);
% y = linspace(0, 1, 208);
% z = linspace(0, 1, 176)
% 
% [X, Y, Z] = meshgrid( y, x, z);
% 
% aux = warp;
% 
% warp(:,:,:,1) = X - aux(:,:,:,2); 
% warp(:,:,:,2) = Y - aux(:,:,:,1); 
% warp(:,:,:,3) = Z - aux(:,:,:,3); 
% 
% write_grid( warp, warp(:,:,:,1), model, true );

function write_grid( warp, warped, model, lap )

warp = squeeze(warp);
warped = squeeze(warped);

[nx, ny, nz] = size(warped);

if lap 

x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
z = linspace(-1,1,nz);

[X, Y, Z] = meshgrid( y, x, z );

phi(:,:,:,1) = X + warp(:,:,:,2);
phi(:,:,:,2) = Y + warp(:,:,:,1);
phi(:,:,:,3) = Z + warp(:,:,:,3);

else

x = linspace(0,nx-1,nx);
y = linspace(0,ny-1,ny);
z = linspace(0,nz-1,nz);

[X, Y, Z] = meshgrid( y, x, z );

phi(:,:,:,1) = X + warp(:,:,:,2);
phi(:,:,:,2) = Y + warp(:,:,:,1);
phi(:,:,:,3) = Z + warp(:,:,:,3);

end

figure;

hold on;
dim = size(phi);
step = 1;

% % Axial
% for i = 1 : step : dim(1)
%     plot(phi(i,:,dim(3)/2, 1), phi(i,:,dim(3)/2,2), 'b');
% end;
% for j = 1 : step : dim(2)
%     handle = plot(phi(:,j,dim(3)/2,1), phi(:,j,dim(3)/2,2), 'b');
% end;
% axis off;
% axis tight;

% Coronal

% phi = squeeze(phi(:,dim(2)/2,:,2:3));
% dim = size(phi);
% 
% for i = 1 : step : dim(1)
%     plot(phi(i,:,1), phi(i,:,2), 'b');
% end;
% for j = 1 : step : dim(2)
%     handle = plot(phi(:,j,1), phi(:,j,2), 'b');
% end;
% axis off;
% axis tight;

% Axial

phi = squeeze(phi(:,:,dim(1)/2,1:2));
dim = size(phi);

for i = 1 : step : dim(1)
    plot(phi(i,:,1), phi(i,:,2), 'b');
end;
for j = 1 : step : dim(2)
    handle = plot(phi(:,j,1), phi(:,j,2), 'b');
end;
axis off;
axis tight;

% Sagittal
% phi = squeeze(phi(dim(1)/2,:,:,[1,3]));
% dim = size(phi);
% 
% for i = 1 : step : dim(1)
%     plot(phi(i,:,1), phi(i,:,2), 'b');
% end;
% for j = 1 : step : dim(2)
%     handle = plot(phi(:,j,1), phi(:,j,2), 'b');
% end;
% axis off;
% axis tight;

% set(gcf,'visible','off') %suppress figure

set(gca,'LooseInset',get(gca,'TightInset')); % removing extra white space in figure
% saveas(gcf,sprintf( '%s_Diffeo_Sagittal.eps', model ),'epsc');   % save
% as COLOR eps file  - Descomentar este para guardar la imagen

% 
% 
% dgrid = interp3( X, Y, Z, grid, XI, YI, ZI, 'linear', 0 );
% 
% warped = dgrid;
% 
% figure;
% imshow( slice( warped, 1 ) );
% 
% imwrite( slice( warped, 1 ), sprintf( '%s_Diffeo_Sagittal.png', model ) );
% 
% figure;
% imshow( slice( warped, 2 ) );
% 
% imwrite( slice( warped, 2 ), sprintf( '%s_Diffeo_Coronal.png', model ) );
% 
% figure;
% imshow( slice( warped, 3 ) );
% 
% imwrite( slice( warped, 3 ), sprintf( '%s_Diffeo_Axial.png', model ) );
% 
% phi(:,:,:,1) = XI;
% phi(:,:,:,2) = YI;
% phi(:,:,:,3) = ZI;
% 
% Jac = Jacobian(phi);
% 
% max(Jac(:))
% 
% min(Jac(:))

end


function s = slice( warp, dim )

    d = size(warp);

    if dim == 1
        s = warp( d(1) / 2 , :, : );
    end

    if dim == 2
        s = warp( :, d(2) / 2 , : );
    end

    if dim == 3
        s = warp( :, :, d(3) / 2 );
    end

    s = squeeze(s);

    s = flipud(s');
end