% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

%datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\Voxelmorph\warp_images_MCI_template_Voxelmorph_1.mat' );
%datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\Voxelmorph\warp_images_MCI_template_Voxelmorph_2.mat' );
%datos3 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\Voxelmorph\warp_images_MCI_template_Voxelmorph_3.mat' );
%datos4 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\Voxelmorph\warp_images_MCI_template_Voxelmorph_4.mat' );
datos5 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\Voxelmorph\warp_images_MCI_template_Voxelmorph_5.mat' );
datos6 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\Voxelmorph\warp_images_MCI_template_Voxelmorph_6.mat' );
datos7 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\Voxelmorph\warp_images_MCI_template_Voxelmorph_7.mat' );

%datos1 = datos1.warp_lista;
%datos2 = datos2.warp_lista;
%datos3 = datos3.warp_lista;
%datos4 = datos4.warp_lista;
datos5 = datos5.warp_lista;
datos6 = datos6.warp_lista;
datos7 = datos7.warp_lista;

jacobianos_MCI = cell(1, 126);

% for i = 1:40
%     warp = datos1(i,:,:,:,:,:);
%     warp = squeeze(warp);
% 
%     % Creamos el grid
%     [nx, ny, nz] = size(warp(:,:,:,1));
% 
%     x = 1 : 1 : nx;
%     y = 1 : 1 : ny;
%     z = 1 : 1 : nz;
% 
%     [X, Y, Z] = meshgrid( y, x, z );
% 
%     XI = squeeze(X + warp(:,:,:,2));
%     YI = squeeze(Y + warp(:,:,:,1));
%     ZI = squeeze(Z + warp(:,:,:,3));
% 
%     phi(:,:,:,1) = XI;
%     phi(:,:,:,2) = YI;
%     phi(:,:,:,3) = ZI;
% 
%     Jac = Jacobian(phi);
% 
%     jac_nii = make_nii(Jac);
% 
%     jacobianos_MCI{i} = jac_nii;
% end
% 
% for i = 1:40
%     warp = datos2(i,:,:,:,:,:);
%     warp = squeeze(warp);
% 
%     % Creamos el grid
%     [nx, ny, nz] = size(warp(:,:,:,1));
% 
%     x = 1 : 1 : nx;
%     y = 1 : 1 : ny;
%     z = 1 : 1 : nz;
% 
%     [X, Y, Z] = meshgrid( y, x, z );
% 
%     XI = squeeze(X + warp(:,:,:,2));
%     YI = squeeze(Y + warp(:,:,:,1));
%     ZI = squeeze(Z + warp(:,:,:,3));
% 
%     phi(:,:,:,1) = XI;
%     phi(:,:,:,2) = YI;
%     phi(:,:,:,3) = ZI;
% 
%     Jac = Jacobian(phi);
% 
%     jac_nii = make_nii(Jac);
% 
%     jacobianos_MCI{i + 40} = jac_nii;
% end
% 
% for i = 1:40
%     warp = datos3(i,:,:,:,:,:);
%     warp = squeeze(warp);
% 
%     % Creamos el grid
%     [nx, ny, nz] = size(warp(:,:,:,1));
% 
%     x = 1 : 1 : nx;
%     y = 1 : 1 : ny;
%     z = 1 : 1 : nz;
% 
%     [X, Y, Z] = meshgrid( y, x, z );
% 
%     XI = squeeze(X + warp(:,:,:,2));
%     YI = squeeze(Y + warp(:,:,:,1));
%     ZI = squeeze(Z + warp(:,:,:,3));
% 
%     phi(:,:,:,1) = XI;
%     phi(:,:,:,2) = YI;
%     phi(:,:,:,3) = ZI;
% 
%     Jac = Jacobian(phi);
% 
%     jac_nii = make_nii(Jac);
% 
%     jacobianos_MCI{i + 80} = jac_nii;
% end
% 
% for i = 1:40
%     warp = datos4(i,:,:,:,:,:);
%     warp = squeeze(warp);
% 
%     % Creamos el grid
%     [nx, ny, nz] = size(warp(:,:,:,1));
% 
%     x = 1 : 1 : nx;
%     y = 1 : 1 : ny;
%     z = 1 : 1 : nz;
% 
%     [X, Y, Z] = meshgrid( y, x, z );
% 
%     XI = squeeze(X + warp(:,:,:,2));
%     YI = squeeze(Y + warp(:,:,:,1));
%     ZI = squeeze(Z + warp(:,:,:,3));
% 
%     phi(:,:,:,1) = XI;
%     phi(:,:,:,2) = YI;
%     phi(:,:,:,3) = ZI;
% 
%     Jac = Jacobian(phi);
% 
%     jac_nii = make_nii(Jac);
% 
%     jacobianos_MCI{i + 120} = jac_nii;
% end

for i = 1:40
    warp = datos5(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = 1 : 1 : nx;
    y = 1 : 1 : ny;
    z = 1 : 1 : nz;

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,1));
    ZI = squeeze(Z + warp(:,:,:,3));

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_MCI{i} = jac_nii;
end

for i = 1:40
    warp = datos6(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = 1 : 1 : nx;
    y = 1 : 1 : ny;
    z = 1 : 1 : nz;

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,1));
    ZI = squeeze(Z + warp(:,:,:,3));

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_MCI{i + 40} = jac_nii;
end

for i = 1:46
    warp = datos7(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = 1 : 1 : nx;
    y = 1 : 1 : ny;
    z = 1 : 1 : nz;

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,1));
    ZI = squeeze(Z + warp(:,:,:,3));

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_MCI{i + 80} = jac_nii;
end

% Calcular la media de las imágenes
suma_imagenes = zeros(size(jac_nii.img)); % Inicializar la suma
for i = 1:126
    suma_imagenes = suma_imagenes + jacobianos_MCI{i}.img;
end
%media_jacobianos_MCI = suma_imagenes / 286;

% Guardar el arreglo y la media en un archivo .mat
save('imagenes_y_media_voxelmorphMCI2.mat', 'jacobianos_MCI', 'suma_imagenes', '-v7.3');