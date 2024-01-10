% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\LapIRN\warp_images_AD_template_LapIRN_1.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\LapIRN\warp_images_AD_template_LapIRN_2.mat' );
datos3 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\LapIRN\warp_images_AD_template_LapIRN_3.mat' );
datos4 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\LapIRN\warp_images_AD_template_LapIRN_4.mat' );
datos5 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\LapIRN\warp_images_AD_template_LapIRN_5.mat' );
%datos6 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\ExperimentoFinal\LapIRN\warp_images_CN_template_LapIRN_6.mat' );

datos1 = datos1.warp_lista;
datos2 = datos2.warp_lista;
datos3 = datos3.warp_lista;
datos4 = datos4.warp_lista;
datos5 = datos5.warp_lista;
%datos6 = datos6.warp_lista;

jacobianos_AD = cell(1, 194);

for i = 1:40
    warp = datos1(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = linspace(-1,1,nx);
    y = linspace(-1,1,ny);
    z = linspace(-1,1,nz);

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,3));
    ZI = squeeze(Z + warp(:,:,:,1));

    XI = XI * (nx-1) / 2;
    YI = YI * (ny-1) / 2;
    ZI = ZI * (nz-1) / 2;

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_AD{i} = jac_nii;
end

for i = 1:40
    warp = datos2(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = linspace(-1,1,nx);
    y = linspace(-1,1,ny);
    z = linspace(-1,1,nz);

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,3));
    ZI = squeeze(Z + warp(:,:,:,1));

    XI = XI * (nx-1) / 2;
    YI = YI * (ny-1) / 2;
    ZI = ZI * (nz-1) / 2;

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_AD{i + 40} = jac_nii;
end

for i = 1:40
    warp = datos3(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = linspace(-1,1,nx);
    y = linspace(-1,1,ny);
    z = linspace(-1,1,nz);

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,3));
    ZI = squeeze(Z + warp(:,:,:,1));

    XI = XI * (nx-1) / 2;
    YI = YI * (ny-1) / 2;
    ZI = ZI * (nz-1) / 2;

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_AD{i + 80} = jac_nii;
end

for i = 1:40
    warp = datos4(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = linspace(-1,1,nx);
    y = linspace(-1,1,ny);
    z = linspace(-1,1,nz);

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,3));
    ZI = squeeze(Z + warp(:,:,:,1));

    XI = XI * (nx-1) / 2;
    YI = YI * (ny-1) / 2;
    ZI = ZI * (nz-1) / 2;

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_AD{i + 120} = jac_nii;
end

for i = 1:34
    warp = datos5(i,:,:,:,:,:);
    warp = squeeze(warp);

    % Creamos el grid
    [nx, ny, nz] = size(warp(:,:,:,1));

    x = linspace(-1,1,nx);
    y = linspace(-1,1,ny);
    z = linspace(-1,1,nz);

    [X, Y, Z] = meshgrid( y, x, z );

    XI = squeeze(X + warp(:,:,:,2));
    YI = squeeze(Y + warp(:,:,:,3));
    ZI = squeeze(Z + warp(:,:,:,1));

    XI = XI * (nx-1) / 2;
    YI = YI * (ny-1) / 2;
    ZI = ZI * (nz-1) / 2;

    phi(:,:,:,1) = XI;
    phi(:,:,:,2) = YI;
    phi(:,:,:,3) = ZI;

    Jac = Jacobian(phi);

    jac_nii = make_nii(Jac);

    jacobianos_AD{i + 160} = jac_nii;
end

% for i = 1:29
%     warp = datos6(i,:,:,:,:,:);
%     warp = squeeze(warp);
% 
%     % Creamos el grid
%     [nx, ny, nz] = size(warp(:,:,:,1));
% 
%     x = linspace(-1,1,nx);
%     y = linspace(-1,1,ny);
%     z = linspace(-1,1,nz);
% 
%     [X, Y, Z] = meshgrid( y, x, z );
% 
%     XI = squeeze(X + warp(:,:,:,2));
%     YI = squeeze(Y + warp(:,:,:,3));
%     ZI = squeeze(Z + warp(:,:,:,1));
% 
%     XI = XI * (nx-1) / 2;
%     YI = YI * (ny-1) / 2;
%     ZI = ZI * (nz-1) / 2;
% 
%     phi(:,:,:,1) = XI;
%     phi(:,:,:,2) = YI;
%     phi(:,:,:,3) = ZI;
% 
%     Jac = Jacobian(phi);
% 
%     jac_nii = make_nii(Jac);
% 
%     jacobianos_CN{i + 200} = jac_nii;
% end

% Calcular la media de las imágenes
suma_imagenes = zeros(size(jac_nii.img)); % Inicializar la suma
for i = 1:194
    suma_imagenes = suma_imagenes + jacobianos_AD{i}.img;
end
media_jacobianos_AD = suma_imagenes / 194;

% Guardar el arreglo y la media en un archivo .mat
save('imagenes_y_media_LapIRN.mat', 'jacobianos_AD', 'media_jacobianos_AD', '-v7.3');